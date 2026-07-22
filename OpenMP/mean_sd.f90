!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program computes the mean adn standard deviation of a set of numbers

program mean_sd
use omp_lib
implicit none

real*8, allocatable, dimension(:) :: x
real*8 :: mean_val, sd_val, err, total
integer :: n, i, chunk

n = 100
chunk = 10

allocate(x(n))

!create the vector x

do i = 1,n
    x(i) = 2.5d0 * i
end do

mean_val = 0.d0
!compute the mean
!$omp parallel default(none) shared(x, mean_val, n, chunk) private(i)
!$omp do schedule(dynamic, chunk) reduction(+:mean_val)
do i = 1,n
    mean_val = mean_val + x(i)
end do
!$omp end do
!$omp end parallel
mean_val = mean_val / (n * 1.d0)

!compute the standard deviation
sd_val = 0.d0
!$omp parallel default(none) shared(x, n, mean_val, sd_val, chunk) private(i)
!$omp do schedule(dynamic, chunk) reduction(+:sd_val)
do i = 1, n
    sd_val = sd_val + (x(i) - mean_val) ** 2.d0
end do
!$omp end do
!$omp end parallel
sd_val = dsqrt(sd_val /(n * 1.d0))

print *, "The mean of the vector is: ", mean_val
print *, "The standard deviation of the vector is: ", sd_val

deallocate(x)
end program mean_sd