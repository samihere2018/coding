!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program approximates Jacobi iteration for solving a system of linear equations using n number of iterations.

program jacobi_iteration
use omp_lib
implicit none
real*8, allocatable, dimension(:,:) :: A
real*8, allocatable, dimension(:) :: b, x_exact, x_old, x_new
integer :: i, j, n, chunk,iter
real*8 :: tol, err, err2, l2_norm

n = 100
chunk = 5


allocate(A(n,n), b(n), x_exact(n), x_old(n), x_new(n))

!define matrix A
do i = 1,n
    A(i,i) = 4.d0
    if (i<n) then
        A(i,i+1) = -1.d0
    end if
    if (i>1) then
        A(i,i-1) = -1.d0
    end if
end do

!define vector b
b(1) = 3.d0
do i = 2,n-1
    b(i) = 2.d0
end do
b(n) = 3.d0

!define exact solution
do i = 1,n
    x_exact(i) = 1.d0
end do

!define initial guess
x_old = 0.d0

tol = 1.d-6
err = 10.d0
iter = 0

!Jacobi iteration
do while (err>tol)
iter = iter + 1
    !$omp parallel default(none) shared(A, b, x_old, chunk, x_new, n) private(i, j)
    !$omp do schedule(dynamic, chunk) 
        do i = 1,n
        !initialise x_new
        x_new(i) = 0.d0
            do j = 1,n
                if (i .ne. j) then
                    x_new(i) = x_new(i) + A(i,j) * x_old(j)
                end if
            end do
            x_new(i) = (1.d0/A(i,i)) * (b(i) - x_new(i))
        end do
    !$omp end do
    !$omp end parallel

    !check the error
    err2 = 0.d0
    !$omp parallel default(none) shared(x_old, x_new, n, err2, chunk) private(i)
    !$omp do schedule(dynamic, chunk) reduction(+:err2)
    do i = 1, n
        err2 = err2 + (x_new(i) - x_old(i))**2.d0
    end do
    !$omp end do
    !$omp end parallel

    err2 = dsqrt(err2)
    write(*,*) "Iteration ", iter, ": L2 norm of the error = ", err2
    err = err2

    if (err<tol) then
        write(*,*) "Jacobi iteration converged after ", iter, " iterations."
        l2_norm = 0.d0
        !$omp parallel default(none) shared(x_new,x_exact, n, chunk,l2_norm) private(i)
        !$omp do schedule(dynamic, chunk) reduction(+:l2_norm)
        do i = 1,n
            l2_norm = l2_norm + (x_new(i) - x_exact(i))**2.d0
        end do
        !$omp end do
        !$omp end parallel
        l2_norm = dsqrt(l2_norm)
        write(*,*) "The L2 norm of the error is: ", l2_norm
    else
        x_old = x_new
    end if
end do

deallocate(A, b, x_exact, x_old, x_new)
end program jacobi_iteration







