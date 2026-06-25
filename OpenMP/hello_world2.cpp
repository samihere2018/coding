// Author: Sylvia Amihere 
// simple OpenMP program in C++ to print "Hello, world!" from multiple threads
// Compilation: gfortran -fopenmp -o hello_world hello_world.f90
#include <omp.h>
#include <stdio.h>

int main (){
    int nthreads, tid;
    // you can set the number of threads to use in the parallel region using omp_set_num_threads()
    omp_set_num_threads(4);

    #pragma omp parallel private(tid)
    {
        tid = omp_get_thread_num();
        printf("hello world from thread %d\n", tid);

        if (tid == 0)
        {
            nthreads = omp_get_num_threads();
            printf("available number of threads = %d\n", nthreads);
        }
    } /* all threads join the master thread and terminate */

    return 0;
}