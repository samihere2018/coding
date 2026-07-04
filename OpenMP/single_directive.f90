!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program uses the SINGLE directive which specifies that the enclosed code is to be executed by only one thread in the team.
!---Threads in the team that do not execute the SINGLE directive, wait at the end fo the enclosed code bloack, unless a NOWAIT clause is specified.
!---This programs computes a vector operation with scalar coefficients.

program single_directive
use omp_lib
implicit none

integer :: i
real*8 :: a, b, c
real*8, dimension(100) :: x, y
a = 4.d0
b = 9.d0

!$omp parallel default(none) shared(y, x, c, a, b) private(i)
!only one thread executes the following code block, while the other threads wait at the end of the block.
    !$omp single
        c = 1.d0 / sqrt(a * b)
        write(*,*) "Thread ", omp_get_thread_num(), " is the only thread computing the value of c: ", c
        !all threads wait at the end of the SINGLE directive unless a NOWAIT clause is specified.
        !nowait clause is avoided here to ensure that all threads have the value of c before they continue with the next block of code.   
    !$omp end single

    !$omp do schedule (dynamic)
        do i = 1, 100
            x(i) = 2.d0 * i
            y(i) = c * x(i)
            write(*,*) "Thread ", omp_get_thread_num(), " : y(", i, ") = ", y(i)
        end do
    !$omp end do nowait
    write(*,*) "Thread ", omp_get_thread_num(), " completed the vector operation."
!$omp end parallel

end program single_directive