!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program solves the 1D heat equation using finite difference and OpenMP for parallelisation.

program heat1d
use omp_lib
implicit none

real*8, allocatable, dimension(:) :: xi, u_exact,u_old, u_new
integer :: i, k, n, nsteps, chunk
real*8 :: tol, alpha, x0, xn, dx, t0, tf, dt, err, r_target


n = 100
chunk = 10
r_target = 0.4d0

!spatial setup
x0 = 0.d0
xn = 1.d0
dx = (xn - x0)/(n-1)

!temporal setup
nsteps = 100000
t0 = 0.d0
tf = 1.d0
dt = (tf - t0)/nsteps

alpha = r_target 

allocate(xi(n), u_exact(n), u_old(n), u_new(n))
do i = 1,n
    xi(i) = x0 + (i-1) * dx
end do

do i = 1, n
    u_exact(i) = 100.d0 * ( 1.d0 - (xi(i)/xn) )
end do

u_old(1) = 100.d0
do i = 2,n-1
    u_old(i) = 0.d0
end do
u_old(n) = 0.d0

do k = 1, nsteps
    u_new(1) = u_old(1)
    u_new(n) = u_old(n)
    !$omp parallel default(none) shared(u_old, u_new, alpha, n, chunk, dt, dx) private(i)
    !$omp do schedule(dynamic, chunk)
    do i = 2, n-1
        u_new(i) = u_old(i) + alpha * ( u_old(i-1) - 2.d0*u_old(i) + u_old(i+1) )
    end do
    !$omp end do
    !$omp end parallel
    u_old = u_new
end do
! print *, u_new

err = 0.d0
do i = 1,n
    err = err + (u_new(i) - u_exact(i))**2.d0
end do
err = sqrt(err/n)
print *, "L2 norm of the error: ", err

deallocate(xi, u_exact, u_old, u_new)
end program heat1d