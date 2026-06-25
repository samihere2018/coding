!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare3.f90
!---In this program, we will use the WORKSHARE directive to specify that a block of code should be executed by all threads in the team.
!---This is useful when you want to perform the same operation on different data in parallel.
!---This directive is only available in Fortran and is not supported in C/C++. 
!---The matrix multilpication used here is teh element-element wise multiplication

program workshare3
use omp_lib
implicit none

integer :: i ,j, n
parameter (n=100)
real*8 :: AA(n,n), BB(n,n), CC(n, n), DD(n, n), first_prod, last_prod, first_sum, last_sum

do j = 1,n
    do i = 1, n
        AA(i,j) = j * 1.d0
        BB(i,j) = i * 1.d0
    end do
end do

!$omp parallel default(none) shared(AA, BB, CC, DD, first_prod, last_prod, first_sum, last_sum)
!$omp workshare
    CC = AA * BB
    DD = AA + BB
    first_prod = CC(1,1) * DD(1,1)
    last_prod = CC(n,n) * DD(n,n)
    first_sum = CC(1,1) + DD(1,1)
    last_sum = CC(n,n) + DD(n,n)
!$omp end workshare nowait
!$omp end parallel

print*, "first product = ", first_prod, " last product = ", last_prod
print*, "first sum = ", first_sum, " last sum = ", last_sum

end program workshare3


