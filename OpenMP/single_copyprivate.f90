!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program uses the SINGLE directive together with the COPYPRIVATE clause.
!---The COPYPRIVATE clause broadacasts the value of its private variables directly to the private variables to all other threads in the team.
!---The COPYPRIVATE clause is associated with the SINGLE directive.

program single_copyprivate
use omp_lib
implicit none

integer :: i, n
parameter(n=100)
real*8 :: x(n), max_val, scale_factor

max_val = 0.d0
scale_factor = 1.d0


!$omp parallel default(none) shared(x, max_val) private(i, scale_factor)
    !$omp do 
        do i = 1,n
            x(i) = (2.d0 * (i + 1.d0)) + 4.d0
        end do
    !$omp end do

    !---find the maximum value of the array x
    !$omp do 
        do i = 1, n
            if (x(i) > max_val) then
                !once a thread finds a value greater than the current max_val, it enters a critical section to update the max_val variable.
                !$omp critical
                    if (x(i) > max_val) then
                        max_val = x(i)
                    end if
                !$omp end critical
            end if
        end do
    !$omp end do

    !$omp single
        write(*,*) "Thread ", omp_get_thread_num(), " found the maximum value of the array x is: ", max_val
    !$omp end single

    !$omp single copyprivate(scale_factor)
        scale_factor = max_val / 2.d0
        write(*,*) "Thread ", omp_get_thread_num(), " is the only thread that computed the value of scale_factor: ", scale_factor
    !$omp end single

    !$omp do 
        do i = 1,n
            x(i) = x(i) * scale_factor
            write(*,*) "Thread ", omp_get_thread_num(), " :x(", i, ")=", x(i)
        end do
    !$omp end do

!$omp end parallel 

end program single_copyprivate

