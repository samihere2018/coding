!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program computes the factorial of a number using the ORDERED directive.
!---The ORDERED directive specifies that iterations of the enclosed loop will be excuted in the same order as if they were
!---executed serially. Threads will need to wait before executing thier chunk of iterations if previous iterations have not completed yet.
!---The ordered directive forces a specific section of code inside a parallel loop to execute one thread at a time in the exact,
!---sequential order of a standard single-threaded loop.
!---The ORDERED directive is used within a do / for loop with an ORDERED clause.


program ordered_directive
use omp_lib
implicit none

integer :: i, n, fact
parameter (n=10)

fact = 1
!$omp parallel default(none) shared(fact) private(i)
!$omp do ordered
    do i = 1, n
        !$omp ordered
          fact = fact * i
            write(*,*) "Thread ", omp_get_thread_num(), " : computes the next product in the factorial sequence at ", i, " : factorial = ", fact
        !$omp end ordered
    end do
!$omp end do
!$omp end parallel
write(*,*) "Factorial of ", n, " : ", fact
end program 




