!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program uses the trapezoidal rule to compute the integral of a function using OpenMP for parallelisation.

program trapezoidal_rule
use omp_lib
implicit none

real*8 :: xi, err, sol, a, b, delta_x
integer :: n, i, chunk

n = 10000
chunk = 10
a = 0.d0
b = dacos(-1.d0) !this is pi
delta_x = (b - a)/(n*1.d0)

sol = (1.d0/2.d0) * (dsin(a) + dsin(b))

!$omp parallel default(none) shared(a, sol, n, chunk, delta_x) private(i, xi)
!$omp do schedule(dynamic, chunk) reduction(+:sol)
do i = 1, n-1
    xi = a + i*delta_x
    sol = sol + dsin(xi)
end do
!$omp end do
!$omp end parallel
sol = sol * delta_x
print *, "The integral of sin(x) from 0 to pi is: ", sol
print *, "The exact solution of the integral of sin(x) from 0 to pi is: ", 2.d0
print *, "The error between the two results is: ", dabs(sol - 2.d0)

end program trapezoidal_rule