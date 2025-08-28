/* FILE: omp_workshare1.cpp
   DESCRIPTION:
      OpenMP Example - Loop Work-sharing - C++ Version
      In this example, the iterations of a loop are scheduled dynamically
      across the team of threads.  A thread will perform CHUNK iterations
      at a time before being scheduled for the next CHUNK of work.
   AUTHOR: Blaise Barney  5/99
   UPDATED: Daniel R. Reynolds (updated to C++), 1/13/2013
   UPDATED: Sylvia Dogbatsey - explanation: Let’s assume we have 4 threads, and the chunk size is 10. 
                                            Here’s how the chunks might be assigned:
                                              Thread 0: Starts by processing chunk 0-9.
                                              Thread 1: Processes chunk 10-19.
                                              Thread 2: Processes chunk 20-29.
                                              Thread 3: Processes chunk 30-39.
                                              Once a thread finishes its chunk, it can dynamically grab the next chunk of work 
                                              from the remaining unassigned iterations. */

#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#define CHUNKSIZE  10
#define N          100


int main (int argc, char *argv[]) {

  // local variables
  int nthreads, tid, i, chunk;
  float a[N], b[N], c[N];

  // Some initializations
  for (i=0; i < N; i++)  a[i] = b[i] = i * 1.0;
  chunk = CHUNKSIZE;

# pragma omp parallel shared(a,b,c,nthreads,chunk) private(i,tid)
  {
    tid = omp_get_thread_num();
    if (tid == 0) {
      nthreads = omp_get_num_threads();
      printf("Number of threads = %i\n", nthreads);
    }
    printf("Thread %i starting...\n", tid);

#   pragma omp for schedule(dynamic,chunk)
    for (i=0; i<N; i++) {
      c[i] = a[i] + b[i];
      printf("Thread %i: c[%i]= %g\n", tid, i, c[i]);
    }

  }  // end parallel 

  return 0;
}  // end main
