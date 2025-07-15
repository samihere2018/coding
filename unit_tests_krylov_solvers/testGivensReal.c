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
 * ----------------------------------------------------------------------------
 * These test functions check some components of a complex-valued
 * SUNLINEARSOLVER module implementation (for more thorough tests,
 * see the main SUNDIALS repository, inside examples/sunlinsol/).

  * The solvers tested are the SUNQRFACT (QR factorization which uses Givens 
 * rotations and QRsol (solves the system Rx = Q^{T}b or the Ax=b, for the solve x).
 * The matrix system used here is real-valued.
 * ----------------------------------------------------------------------------
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

int SUNQRfact(int n, sunscalartype** h, sunscalartype* q, int job);
int SUNQRsol(int n, sunscalartype** h, sunscalartype* q, sunscalartype* b);

int main(int argc, char* argv[])
{
  sunscalartype* givens;
  sunscalartype* yg;
  sunscalartype* exactSol;
  SUNContext sunctx;
  sunscalartype** H;
  int ndim = 5; //number of columns of the matrix
  int k, kk,l, job, n, krydim;

  if (SUNContext_Create(SUN_COMM_NULL, &sunctx))
  {
    printf("ERROR: SUNContext_Create failed\n");
    return (-1);
  }

  /* Create vectors */

  H = (sunscalartype**)malloc((ndim+1) * sizeof(sunscalartype*)); 
  for (k = 0; k <= ndim; k++)
  {
    H[k] = NULL;
    H[k] = (sunscalartype*)malloc(ndim * sizeof(sunscalartype)); 
  }

  givens = (sunscalartype*)malloc(2 * (ndim) * sizeof(sunscalartype));
  yg = (sunscalartype*)malloc((ndim +1) * sizeof(sunscalartype));
  exactSol = (sunscalartype*)malloc((ndim) * sizeof(sunscalartype));


  /* set up matrix */
  /*~~~~~~~~~~~~~~~~~~~~~~~~~ 6-by-5 matrix, ndim = 5 ~~~~~~~~~~~~~~~~~~~~~~~~~~*/
  H[0][0] = 4.0;   H[0][1] = 3.0;   H[0][2] = -1.0;  H[0][3] = 2.0;   H[0][4] = 6.0; //row 1
  H[1][0] = -1.0;  H[1][1] = 9.0;   H[1][2] = 5.0;   H[1][3] = 2.0;   H[1][4] = 3.0; //row 2
  H[2][0] = 0.0;   H[2][1] = -4.0;  H[2][2] = 3.0;   H[2][3] = 1.0;   H[2][4] = -7.0; //row 3
  H[3][0] = 0.0;   H[3][1] = 0.0;   H[3][2] = 1.0;   H[3][3] = 10.0;  H[3][4] = 4.0; //row 4
  H[4][0] = 0.0;   H[4][1] = 0.0;   H[4][2] = 0.0;   H[4][3] = 3.0;   H[4][4] = -2.0; //row 5
  H[5][0] = 0.0;   H[5][1] = 0.0;   H[5][2] = 0.0;   H[5][3] = 0.0;   H[5][4] = 8.0; //row 5

  yg[0] = 1.0;
  yg[1] = -4.0;
  yg[2] = 3.0;
  yg[3] = 2.0;
  yg[4] = 8.0;
  yg[5] = 5.0;

  exactSol[0] = 0.367281678716080  + 0.0*I;
  exactSol[1] = -0.715472518804680 + 0.0*I;
  exactSol[2] = 0.268391562142706  + 0.0*I;
  exactSol[3] = 0.322709872729248  + 0.0*I;
  exactSol[4] = 0.208661611483312  + 0.0*I;

  /* perform QR factorization using Givens rotation */
  for (k=0; k<ndim; k++)
  {
    krydim = k+1;
    SUNQRfact(krydim, H, givens, k); 
  }

  /*Solve the system Ax=b, for x, using Rx = Q^{T}b*/
  SUNQRsol(ndim, H, givens, yg);

  /*Compare the approximated solution with the actual solution*/
  sunrealtype tolerance = 1e-14;
  int checkSolReal = 0;
  int checkSolImag = 0;
  for (k=0; k<ndim; k++){
    if ((SUNabs(creal(yg[k])-creal(exactSol[k])))>tolerance){checkSolReal=1;}
    if ((SUNabs(cimag(yg[k])-cimag(exactSol[k])))>tolerance){checkSolImag=1;}
  }
  if (checkSolReal==0 && checkSolImag==0){
    printf("Test Passed!\n");
  }

  /* return with success */
  return 0;
}
