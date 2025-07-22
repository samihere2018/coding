/* Author: This program computes the dot product of two vectors a and b
   Source: Professor Daniel R. Reynolds' Parallel Computing Lecture 2 Notes
   Date: 22nd July 2025 
   Run: to run on your terminal you can use; g++ -o dummyname name_of_file.cpp
                                             ./dummyname value_of_n */

   #include <stdlib.h>
   #include <time.h>
   #include <stdio.h>

   int main(int argc, char* argv[]){

    // declarations 
    int i, n;
    double *a, *b, sum, rtime;
    clock_t stime, ftime;

    //ensure that an argument was passed in
    if (argc < 2){
        printf("Error: requires 2 arguments!\n");
        return 1;
    }

    //set n as an imput argument, ensure it's positive
    n = atoi(argv[1]);
    if (n < 1){
        printf("Error: n must be a positive interger!\n");
        return 1;
    }

    //allocate the vectors
    a = new double[n];
    b = new double[n];

    //intialise the vector values
    for (i=0; i<n; i++){
        a[i] = (0.001 * (i + 1.0)) / n;
        b[i] = (0.001 * (n - i - 1.0))/n;
    }

    //calculate the dot product of the two vectors
    stime = clock();
    sum = 0.0;
    for (i=0; i<n; i++){
        sum  = sum + (a[i]*b[i]);
    }
    ftime = clock();
    rtime = double (ftime - stime)/CLOCKS_PER_SEC;

    //output
    printf(" vector length = %i\n", n);
    printf("   dot product = %.16e\n", sum);
    printf("      run time = %.2e\n", rtime);

    //delete the vectors
    delete[] a;
    delete[] b;

    return 0;
   }