/* -----------------------------------------------------------------
 * Programmer(s): Sylvia Amihere @ SMU
 * -----------------------------------------------------------------
 * SUNDIALS Copyright Start
 * Copyright (c) 2002-2024, Lawrence Livermore National Security
 * and Southern Methodist University.
 * All rights reserved.
 *
 * See the top-level LICENSE and NOTICE files for details.
 *
 * SPDX-License-Identifier: BSD-3-Clause
 * SUNDIALS Copyright End
 * ------------------------------------------------------------------------
 * These test functions check some components of a complex-valued
 * SUNLINEARSOLVER module implementation (for more thorough tests,
 * see the main SUNDIALS repository, inside examples/sunlinsol/).

 * The solvers tested are the different QR decomposition variants
 * used in Anderson Acceleration.
 * The matrix and vectors used here are real-valued.
 * ------------------------------------------------------------------------
 */


#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "sundials_iterative.h"
#include "sundials_iterative_impl.h" 


#if defined(SUNDIALS_EXTENDED_PRECISION)
#define GSYM "Lg"
#define ESYM "Le"
#define FSYM "Lf"
#else
#define GSYM "g"
#define ESYM "e"
#define FSYM "f"
#endif

SUNErrCode SUNQRAdd_MGS(N_Vector* Q, sunscalartype* R, N_Vector df, int m,
                               int mMax, void* QRdata);

SUNErrCode SUNQRAdd_ICWY(N_Vector* Q, sunscalartype* R, N_Vector df, int m,
                                int mMax, void* QRdata);

SUNErrCode SUNQRAdd_CGS2(N_Vector* Q, sunscalartype* R, N_Vector df, int m,
                                int mMax, void* QRdata);

SUNErrCode SUNQRAdd_DCGS2(N_Vector* Q, sunscalartype* R, N_Vector df, int m,
                                int mMax, void* QRdata);


int main(int argc, char* argv[])
{
  N_Vector* Q;
  N_Vector x;
  SUNContext sunctx;
  int k, l, m, mMax;
  sunrealtype vnorm;
  sunscalartype* temp_array;

  if (SUNContext_Create(SUN_COMM_NULL, &sunctx))
  {
    printf("ERROR: SUNContext_Create failed\n");
    return (-1);
  }
  SUNQRData qrdata;
  qrdata = (SUNQRData)malloc(sizeof(*qrdata));

  /* Create vectors */
  x = N_VNew(3, sunctx);
  Q = N_VCloneVectorArray(3, x);
  N_Vector vtemp = N_VClone(x);
  N_Vector vtemp2 = N_VClone(x);
  N_Vector df_True = N_VClone(x);
  N_Vector R_Approx =  N_VClone(x);
  N_Vector df_Approx =  N_VClone(x);

  qrdata->vtemp = vtemp;
  qrdata->vtemp2 = vtemp2;//together with temp_array, they are used in all the other QRAdd variants except QRAdd_MGS

  /* this stores the elements of the correction matrix (square matrix) as a one column vector by stacking the columns together starting with the first column */
  qrdata->temp_array = (sunscalartype*)malloc((9) * sizeof(sunscalartype));

  m = 2;  //number of vectors already orthogonalised (and are othornormal)
  mMax = 3; //number of rows = number of columns of the matrix Q


  /* the vector to orthogonalise */
  sunscalartype* dfdata = N_VGetArrayPointer(df_True);
  dfdata[0] = 4.0   + 0.0*I;
  dfdata[1] = -68.0 + 0.0*I;
  dfdata[2] = -41.0 + 0.0*I;

  /* set up matrix, last column is obtained from any of the QRAdd functions */
  sunscalartype* vdata = N_VGetArrayPointer(Q[0]);
  vdata[0] = SUN_RCONST(6.0/7.0) + 0.0*I;
  vdata[1] = (3.0/7.0)  + 0.0*I;
  vdata[2] = -(2.0/7.0) + 0.0*I;

  vdata = N_VGetArrayPointer(Q[1]);
  vdata[0] = -(69.0/175.0) + 0.0*I;
  vdata[1] = (158.0/175.0) + 0.0*I;
  vdata[2] = (6.0/35.0)  + 0.0*I;

  vdata = N_VGetArrayPointer(Q[2]);
  vdata[0] = 0.0 + 0.0*I;
  vdata[1] = 0.0 + 0.0*I;
  vdata[2] = 0.0 + 0.0*I;

  /* upper trinagular matrix R, the last column is obtained from any of the QRAdd functions*/
  sunscalartype R[9] = {14.0 + 0.0*I, 0.0, 0.0,
                         21.0 + 0.0*I, 175.0 + 0.0*I, 0.0,
                         0.0, 0.0, 0.0 };//R matrix stored as a column vector by stacking columns together starting with the first column 
 

  char functionName[100] = "sunqradd_mgs"; // default function name

  if (argc > 1) {
    strcpy(functionName, argv[1]); //if a function name (2nd argument) is provided after executable name
  }

  if (strcmp(functionName, "sunqradd_mgs") == 0) {
    SUNQRAdd_MGS(Q, R, df_True, m, mMax, qrdata);
    printf("Using SUNQRAdd_MGS \n");
  }
  else if (strcmp(functionName, "sunqradd_icwy") == 0) {
    SUNQRAdd_ICWY(Q, R, df_True, m, mMax, qrdata);
    printf("Using SUNQRAdd_ICWY \n");
  }
  else if (strcmp(functionName, "sunqradd_cgs2") == 0) {
    SUNQRAdd_CGS2(Q, R, df_True, m, mMax, qrdata);
    printf("Using SUNQRAdd_CGS2 \n");
  }
  else if (strcmp(functionName, "sunqradd_dcgs2") == 0) {
    SUNQRAdd_DCGS2(Q, R, df_True, m, mMax, qrdata);
    printf("Using SUNQRAdd_DCGS2 \n");
  }
  else {
    printf("Incorrect function name, use: sunqradd_mgs or sunqradd_icwy or sunqradd_cgs2 or sunqradd_dcgs2. \nUsing default: sunqradd_mgs\n");
    SUNQRAdd_MGS(Q, R, df_True, m, mMax, qrdata); // Default function
  }

  /* Threshold for orthogonal vectors in matrix Q and imaginary component for the norm of a column vector in Q */
  sunrealtype tolerance = 1e-14;

  /* check dot product results */
  int unit_vectorsReal = 0;
  int unit_vectorsImag = 0;
  int orthogonalReal = 0;
  int orthogonalImag = 0;
  int solnCheckReal = 0;
  int solnCheckImag = 0;


  for (k=0; k<3; k++)
  {
    for (l=0; l<3; l++)
    {
        float vnorm = N_VDotProd(Q[k],Q[l]);
        if ((k==l) && (SUNabs(SUNabs(creal(vnorm))-SUN_RCONST(1.0)))>tolerance){unit_vectorsReal = 1;} //unit vectors
        if ((k==l) && (SUNabs(cimag(vnorm))>tolerance)){unit_vectorsImag = 1;}
        if ((k!=l) && (SUNabs(creal(vnorm))>tolerance)) {orthogonalReal = 1;}//orthogonal vectors
        if ((k!=l) && (SUNabs(cimag(vnorm))>tolerance)) {orthogonalImag = 1;}
    }
  }

  /* the last column in R */
  sunscalartype* Rdata = N_VGetArrayPointer(R_Approx);
  Rdata[0] = R[6];
  Rdata[1] = R[7];
  Rdata[2] = R[8];

  /* use the last column in R to check if the product of the last column of Q and R gives df_True */
  sunscalartype* finalR = N_VGetArrayPointer(df_Approx);
  finalR[0] = 0.0;
  finalR[1] = 0.0;
  finalR[2] = 0.0;

  /* multiply Q by the last column of R (the result) and the final answer should be df */
  N_VLinearCombination(3, Rdata, Q, df_Approx);
  for (l=0;l<3;l++){
    if (SUNabs(creal(dfdata[l]) - creal(finalR[l]))>tolerance ){solnCheckReal = 1;}
    if (SUNabs(cimag(dfdata[l]) - cimag(finalR[l]))>tolerance ){solnCheckImag = 1;}
  }

  /* Check if the computed last columns of Q and R are correct. */
  if ((solnCheckReal==0) && (solnCheckImag==0) && (orthogonalReal==0) && (orthogonalImag==0) && (unit_vectorsReal==0) && (unit_vectorsImag==0)) {
    printf("Test passed!\n");
  } 
  else {
    printf("Test failed!\n");
    return 1;
  }

  /* return with success */
  return 0;
}
