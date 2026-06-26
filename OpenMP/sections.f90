!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare4.f90
!---Another example of SECTIONS directive.

program sections
use omp_lib
implicit none

integer :: nthreads, i, tid
real*8 :: result1, result2, result3

!$omp parallel default(none) shared(nthreads,result1,result2,result3)
!$omp sections

!$omp section
result1 = 4.d0 * 5.d0
write(*,*) "Thread ", omp_get_thread_num(), " : result1 = ", result1

!$omp section
result2 = 6.d0 * 10.d0
write(*,*) "Thread ", omp_get_thread_num(), " : result2 ", result2

!$omp section
result3 = result1 + result2
write(*,*) "Thread ", omp_get_thread_num(), " : final result = ", result3

!$omp end sections
!$omp end parallel
end program sections

