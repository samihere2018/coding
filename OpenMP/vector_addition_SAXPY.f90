!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare1.f90
!---This program computes the addition of two vectors using the SAXPY operation. 
!---The program demonstrates the use of OpenMP directives to parallelize the computation across multiple threads.

program vector_addition_SAXPY
use, intrinsic :: iso_fortran_env, only: real32
use omp_lib
implicit none

real(real32), allocatable :: A(:), B(:), C(:)
real(real32) :: vec_a, vec_b
integer :: i, n, tid, chunk
n = 100
chunk = 10
vec_a = 2.0
vec_b = 3.0

allocate(A(n), B(n), C(n))

!Initialize vectors A and B
!$omp parallel default(none) shared(A, B, C, chunk, vec_a, vec_b, n) private(i, tid)
tid = omp_get_thread_num()
!$omp do schedule(dynamic, chunk)
    do i = 1,n
        A(i) = i * 1.0
        B(i) = 2.0 * A(i)
    end do
!$omp end do

!$omp do schedule(dynamic, chunk)
    do i = 1, n
        C(i) = vec_a*A(i) + vec_b*B(i)
        print *, "Thread ", tid, " :C(", i, ")= ", C(i)
    end do
!$omp end do nowait
!$omp end parallel

deallocate(A, B, C)
end program vector_addition_SAXPY

