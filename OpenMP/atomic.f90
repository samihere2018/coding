!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program uses the ATOMIC directive to ensure that only one thread at a time can execute a particular section of code. 
!---The ATOMIC directive specifies that a specific memory location must be updated atomically, rather than letting multiple threads attempt to write to it. 
!---This directive provides a mini-CRITICAL section.

program atomic_directive
use omp_lib
implicit none

integer :: i , n, counter
parameter (n=10)

counter = 0

!$omp parallel default(none) shared(counter) private(i)
do i = 1,n
    !$omp atomic
        !the directive works on only a single statement, so the increment operation is performed atomically
        counter = counter + 1
    !$omp end atomic
end do
!$omp end parallel
write(*,*) "Final counter value: ", counter

end program atomic_directive