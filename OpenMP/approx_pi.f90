!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program approximates the values of PI using n number of rectangles (Riemann Sum and midpoint rule).

program approx_pi
use omp_lib
implicit none

integer :: i, n, chunksize, tid
real*8 :: result_pi, delta_x, total_time, total_start_time, start_time, end_time, thread_duration, xi, exact_pi

exact_pi = dacos(-1.d0)
chunksize = 10
result_pi = 0.d0

print *, "Enter the number of rectangles to use in the approximation of PI: "
read(*,*) n
if (n<0) then
    write(*,*) "Enter a positive number of rectangles."
    stop
elseif (n==0) then
    write(*,*) "PI will be approximated using 10 rectangles."
    n = 10
end if
total_start_time = omp_get_wtime()

!$omp parallel default(none) shared(n, chunksize, result_pi, delta_x) private(i, tid, start_time, end_time, thread_duration, xi)
    tid = omp_get_thread_num()
    start_time = omp_get_wtime()
    !$omp single
        delta_x = ((1.d0 - 0.d0) / n) * 1.d0
    !$omp end single

    !$omp do schedule(static, chunksize) reduction(+:result_pi)
        do i = 1, n
            xi = (i - 0.5d0) * delta_x
            result_pi = result_pi + (4.d0 / (1.d0 + (xi ** 2.d0))) * delta_x
        end do
    !$omp end do
    end_time = omp_get_wtime()
    thread_duration = end_time - start_time
    write(*,*) "Thread ", tid, " : duration = ", thread_duration
!$omp end parallel
write(*,*) "***************************************************************************************************** "
write(*,*) "The approximate value of PI using ", n, " rectangles: ", result_pi 
write(*,*) "Absolute error in the approximation of PI using " , n, " rectangles: ", dabs(result_pi - exact_pi)
write(*,*) "Total time taken to compute the approximation of PI using ", n, " rectangles: ", omp_get_wtime() - total_start_time
write(*,*)  "***************************************************************************************************** "

end program approx_pi
