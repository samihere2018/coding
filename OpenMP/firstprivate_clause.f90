!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program computes the Taylor series for ln(x) around point a.
!---This program uses the FIRSTPRIVATE clause.
!---The FIRSTPRIVATE clause creates a local copy of each thread and copies the initial value into it.

program firstprivate
use omp_lib
implicit none

integer :: i, n
parameter(n=20)
real*8 :: shifted_val, result, x_val
shifted_val = 1.d0
x_val = 3.d0
result = 0.d0

!$omp parallel default(none) shared (result, x_val) private(i) firstprivate(shifted_val)
!$omp do ordered
    do i = 1,n
        !$omp ordered
            result = result + ( ((-1.d0)**(i-1)) / ( i * (shifted_val ** i)) ) * (x_val - shifted_val)**i
            write(*,*) "Thread ", i, " estimated the ", i, "-th term in the the Taylor series : ", result
        !$omp end ordered
    end do
!$omp end do
!$omp end parallel

write(*,*) "The approximation of ln (", x_val, ") centered at ", shifted_val, " using ", N, " points : ", result
end program firstprivate