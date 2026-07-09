!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program approximates the values of PI using the Simpson's Rule

program approx_pi_simpson
use omp_lib
implicit none


integer :: i, n, chunksize, tid
real*8 :: result_pi, delta_x, xi, exact_pi
real*8 ::start_time, end_time, thread_duration, total_start_time, total_time

print *, "Enter the number of subintervals to use in the approximation of PI: "
read(*,*) n
if (n<=0) then
    write(*,*) "The number of subintervals must be a positive integer, hence 10 subintervals will be used."
    n = 10
end if

exact_pi = dacos(-1.d0)
chunksize = 10
delta_x = (1.d0 - 0.d0) / n
result_pi = (4.d0 /(1.d0 + (0.d0 ** 2.d0))) + (4.d0 /(1.d0 + (1.d0 ** 2.d0)))
total_start_time = omp_get_wtime()

!$omp parallel default(none) shared(chunksize, delta_x, result_pi, n) private(i, tid, start_time, end_time, thread_duration, xi)
!$omp do schedule(static, chunksize) reduction(+:result_pi)
    do i = 1,n
        xi = 0.d0 + (i * delta_x)
        if (mod(i,2).eq.0) then
            result_pi = result_pi + 2.d0 * (4.d0 /(1.d0 + (xi ** 2.d0)))
        elseif (mod(i,2).eq.1) then
            result_pi = result_pi + 4.d0 * (4.d0 /(1.d0 + (xi ** 2.d0)))
        end if
    end do
!$omp end do
end_time = omp_get_wtime()
thread_duration = end_time - start_time
write(*,*) "Thread ", tid, "  duration :", thread_duration
!$omp end parallel
write(*,*) " ******************************************************************************************************** "
write(*,*) " The approximation of PI using Simpson's rule with ", n, " subintervals is ", result_pi * (delta_x / 3.d0)
write(*,*)"  Absolute error in approximation of PI using Simpson's rule is ", dabs(exact_pi - result_pi)
write(*,*) " Total time taken to approximate PI using Simpson's rule is ", omp_get_wtime() - total_start_time
write(*,*) " ******************************************************************************************************** "
end program approx_pi_simpson
