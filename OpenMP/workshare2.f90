!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program compute the component wise sum and product of two vectors and stores the results in two vectors C and D

program workshare2
use omp_lib
implicit none

integer :: nthreads, tid, i, n
parameter (n=100)
real*8 :: A(n), B(n), C(n), D(n)

do i = 1,n
    A(i) = 2.d0 * i
    B(i) = 0.5d0 *i
end do

!$omp parallel default(none) shared(nthreads, A, B, C, D) private(tid, i)
tid = omp_get_thread_num()
if (tid.eq.0) then
    nthreads = omp_get_num_threads()
    print*, "available number of threads = ", nthreads
end if

print*, "Thread ", tid, "starting ..."

!---in this block all threads do the same work but on different data
!---omp sections opens the section construct. Each section is executed by a single thread. 
!---The sections construct is used to specify different tasks that can be performed in parallel. 
!---Each section is defined by a separate block of code and the threads will execute one of the sections. 
!---The nowait clause allows threads to continue without waiting for other threads to finish their section.
!$omp sections

!$omp section
do i = 1, n
    C(i)  = A(i) + B(i)
    write(*, *) "thread ", tid , " :C( ", i, " ) = ", C(i)
end do

!$omp section
do i = 1,n
    D(i) = A(i) * B(i)
    write(*,*) "Thread ", tid,  ": D( ", i, ") = ", D(i)
end do

!$omp end sections nowait

print*, "Thread ", tid, " done!"

!$omp end parallel

end program workshare2