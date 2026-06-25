!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare4.f90
!---In this program, we will see how parallel directives can be continued on the the next line.
!---This is useful when you have a long directive that cannot fit on one line.
!---This program is for vector addition.

program workshare4
use omp_lib
implicit none

integer :: nthreads, tid, i ,n, chunk, chunksize
parameter (n=100)
parameter (chunksize=10)
real*8 :: A(n), B(n), C(n)
chunk = chunksize

do i = 1,n
    A(i) = i * 2.d0
    B(i) = A(i)
end do

!$omp parallel do &
!$omp shared(nthreads, A, B, C, chunk) private(tid, i) &
!$omp schedule (dynamic, chunk)

do i = 1, n
   C(i) = A(i) + B(i)
   write(*,*) "thread ", omp_get_thread_num(), " : C( ", i, " ) = ", C(i)
end do

!$omp end parallel do 

end program workshare4

