!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program computes the factorial of a number using the ORDERED directive.
!---The REDUCTION clause is a way to safely combine values calculated by different threads into a single value. 
!---Format: ***reduction(arithmetic operation: list)
!---Variables in the list must be declared SHARED.

program reduction_dotProd
use omp_lib
implicit none

integer :: i, n, chunksize
parameter(n=20)
parameter(chunksize=10)
real*8 :: A(n), B(n), result_dotProd


A = 0.d0
B = 0.d0
result_dotProd = 0.d0

!$omp parallel do default(none) schedule(dynamic, chunksize) shared(A, B) private(i) 
do i = 1, n
    A(i) = 2.d0 * (i + 1.d0)
    B(i) = 3.5d0 + (i + 1.d0)
    write(*,*) "Thread ", omp_get_thread_num(), " : A(", i, ") = ", A(i), " : B(", i, ") = ", B(i)
end do
!$omp end parallel do


!$omp parallel do default(none) schedule(dynamic, chunksize) shared(A, B) private(i) reduction(+:result_dotProd)
do i = 1, n
    result_dotProd = result_dotProd + (A(i) * B(i))
end do
!$omp end parallel do

write(*,*) "The dot product of the two vectors A and B is: ", result_dotProd

end program reduction_dotProd


