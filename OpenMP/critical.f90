!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program uses the CRITICAL directive to ensure that only one thread at a time can execute a particular section of code. 
!---This is useful when multiple threads need to update a shared variable or resource, and we want to prevent race conditions.
!---No two threads can execute the critical section at the same time.
!---Here each thread increments a shared counter variable, and the critical section ensures that the increment operation is performed atomically.
!---Hence, if the the counter is supposed to be increased n times, the final output will be n times the number  of threads since each thread will increment the counter n times.

program critical_directive
use omp_lib
implicit none

integer :: i, n, counter
parameter (n=10)

counter = 0
!$omp parallel default (none) shared(counter) private(i)
do i = 1, n
    !$omp critical
        counter = counter + 1
        write(*,*) "Thread ", omp_get_thread_num(), " incremented counter to ", counter , " at iteration ", i
    !$omp end critical
end do
    
!$omp end parallel

end program critical_directive
