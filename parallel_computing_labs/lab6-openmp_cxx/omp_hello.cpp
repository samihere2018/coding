/* FILE: omp_hello.cpp
   DESCRIPTION:
      OpenMP Example - Hello World - C++ Version
      In this simple example, the master thread forks a parallel region.
      All threads in the team obtain their unique thread number and print it.
      The master thread only prints the total number of threads.  Two OpenMP
      library routines are used to obtain the number of threads and each
      thread's number.
   AUTHOR: Blaise Barney  5/99
   UPDATED: Daniel R. Reynolds (updated to C++), 1/13/2013
   UPDATED: Sylvia Dogbatsey: you can set the number of threads in the code (line 23) 
            or you can set it on the command line before running your code
            Example: $ g++-15 -fopenmp -o hello_omp omp_hello.cpp 
                     $ export OMP_NUM_THREADS=15
                     $ ./hello_omp */

#include <omp.h>
#include <stdio.h>
#include <stdlib.h>

int main (int argc, char *argv[]) {

  // local variables
  int nthreads, tid;

  // // Sylvia: You can set the number of threads programmatically
  // omp_set_num_threads(4); // Set the number of threads to 4

  // Fork a team of threads giving them their own copies of variables
# pragma omp parallel private(nthreads, tid)
  {

    // Obtain thread number
    tid = omp_get_thread_num();
    printf("Hello World from thread = %i\n", tid);

    // Only master thread does this
    if (tid == 0) {
      nthreads = omp_get_num_threads();
      printf("Number of threads = %i\n", nthreads);
    }

  } // All threads join master thread and disband
  
  return 0;
}  // end main
