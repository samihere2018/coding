!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program computes e^x using the Maclaurin series expansion of a number.
!---The ORDERED directive specifies thta itreations of the enclosed loop will be excuted in the same order as if they were
!---executed serially. Threads will need to wait before executing their chunk of iterations if previous iterations 
!---have not completed yet.
!---The ORDERED directive is used within a do / for loop with an ORDERED clause.

program ordered_maclaurin_epx
use omp_lib
implicit none

integer :: i, n
!the next two lines say: give me an integer big enough to hold at least 18 digits instead of using integer*8 :: fact
integer, parameter :: dp_int = selected_int_kind(18)
integer(kind=dp_int) :: fact
!integer*8 :: fact
real*8 :: x, exp_result
parameter (n=20)
parameter (x=3)

exp_result = (3.d0**0.d0)/1.d0
fact = 1
!$omp parallel default(none) shared(fact, exp_result) private(i)
!$omp do ordered
    do i = 1,n
        !$omp ordered
            fact = fact * i
            exp_result = exp_result + ((x**(i*1.d0)) / fact) * 1.d0
            write(*,*) "Thread ", omp_get_thread_num(), " computes the ", i, "-th term in the Maclaurin series which is &
                        x^", i, "/factorial(", i, "): ", exp_result
        !$omp end ordered
    end do
!$omp end do
!$omp end parallel

write(*,*) "The approximate value of e^", x, " using Maclaurin series expansion is: ", exp_result
print *, "Selected kind: ", dp_int
print *, "Actual bit size: ", bit_size(fact)

end program ordered_maclaurin_epx