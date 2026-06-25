!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare1.f90
!---This program uses the BARRIER directive to synchronize threads at a certain point in the code.
!---All threads must reach the barrier before any thread can proceed beyond it.
!---This is useful when you want to ensure that all threads have completed a certain task before moving on to the next part of the program.

program barrier_directive
use omp_lib
implicit none

integer :: tid, neighbour_id, neighbour_data, shared_array(0:9)

!$omp parallel default(none) shared(shared_array) private(tid, neighbour_id, neighbour_data)

tid = omp_get_thread_num()

! Each thread initializes its portion of the shared array
shared_array(tid) = tid * 2.d0
write(*,*) "Thread ", tid, " finished writing to shared_array"

neighbour_id = mod(tid + 1, omp_get_num_threads())


!all threads must reach this point before any thread can proceed otherwise there will be a race condition and errors in the output
!$omp barrier

!after all threads have reached the barrier, they can now safely read from the shared array
neighbour_data = shared_array(neighbour_id)
write(*,*) "Thread ", tid, " has neighbour ", neighbour_id, " with data ", neighbour_data

!$omp end parallel
end program barrier_directive