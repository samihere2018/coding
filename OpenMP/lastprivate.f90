!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program uses the LASTPRIVATE clause.
!---The LASTPRIVATE clause encures that the final value of a privatised variable is copied back to the outer context's original variable once a 
!---parallel region is completed. The final value of the variable is the value that was computed by the last iteration of the loop and not the value
!---computed by the last (late) thread.

program lastprivate
use omp_lib
implicit none

integer :: i, n
parameter(n=1000)
real*8 :: last_val 

last_val = 0.d0

!$omp parallel do default(none) lastprivate(last_val) private(i)
    do i = 1,n
        last_val = last_val + i
        write(*,*) "Thread ", omp_get_thread_num(), " computes the value of last_val at iteration ", i, " : last_val = ", last_val
    end do
!$omp end parallel do

write(*,*) "The final value of last_val after the parallel region is: ", last_val
end program lastprivate