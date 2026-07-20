!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program computes the sum of squares of an array using OpenMP for parallelisation.

program SumOfSquares
use omp_lib
implicit none

real*8 :: alg_for, result, err
integer :: n, i, chunk

n = 10000
chunk = 10
result = 0.d0


!algebraic formulation of sum of squares
alg_for = n * (n + 1.d0) * (2.d0 *n + 1.d0) / 6.d0

!$omp parallel default(none) shared(n, result, chunk) private(i)
!$omp do schedule(dynamic, chunk) reduction(+:result)
do i = 1, n
    result = result + i ** 2.d0
end do
!$omp end do
!$omp end parallel

print *, "The sum of squares from 1 to ", n, " is: ", result
print *, "The algebraic formulation of sum of squares from 1 to ", n, " is: ", alg_for
err = dabs(result - alg_for)
print *, "The error between the two results is: ", err

end program SumOfSquares


