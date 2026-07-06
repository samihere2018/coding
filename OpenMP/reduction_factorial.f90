!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program computes the factorial of a number using the ORDERED directive.
!---The REDUCTION clause is a way to safely combine values calculated by different threads into a single value. 
!---Format: ***reduction(arithmetic operation: list)
!---Variables in the list must be declared SHARED.

program reduction_factorial
use omp_lib
implicit none

integer :: i, n, fact
parameter(n=6)
fact = 1

!$omp parallel do default(none) schedule (dynamic) private(i) reduction(*:fact)
do i = 1,n
fact = fact * i
write(*,*) "Thread ", i, "computes the next product in the factorial sequence at ", i, " : factorial = ", fact
end do
!$omp end parallel do

write(*,*) "Factorial of ", n, " : ", fact

end program reduction_factorial
