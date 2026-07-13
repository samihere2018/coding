!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program computes the dot product of two vectors using a subroutine called  by the main program.
!---This is known as an orphan directive because the subroutine is not in the same file as the main program. 
!---The subroutine is called by the main program and the parallel region is defined in the subroutine.

program orphan_directive_dotProd
use omp_lib
implicit none

integer :: i, tid, n
parameter(n=100)
real*8 :: A(n), B(n), result_dotprod

do i = 1, n
    A(i) = i + 1.d0
    B(i) = 2.d0 * A(i)
end do

result_dotprod = 0.d0
!$omp parallel default(none) shared(A, B, result_dotprod) 
call dotProd(A, B, n, result_dotprod)
!$omp end parallel

write(*,*) "The dot product of A and B is: ", result_dotprod
end program orphan_directive_dotProd


subroutine dotProd(A, B, n, result_dotProd)
use omp_lib
implicit none
integer :: n, tid, i
real*8 :: A(n), B(n), result_dotProd

tid = omp_get_thread_num()
!$omp do reduction(+:result_dotProd)
    do i = 1, n
        result_dotProd = result_dotProd + (A(i) * B(i))
    end do
!$omp end do
write(*,*) "Thread ", tid, " i : ", i
return
end subroutine dotProd