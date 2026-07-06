!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program uses the THREADPRIVATE directive and the copyin clause.
!---The THREADPRIVATE directive allows each thread to have its own copy fo the global data.
!---Hence, when a thread updates its global data, the other threads have the original global data before their own individual updates.
!---The COPYIN clause provides a means for assigning the same value to THREADPRIVATE variables for all threads in a team.

program threadprivate
use omp_lib
implicit none

integer :: i, tid
real*8 :: thread_result, subtotal
common /thread_data/ thread_result, subtotal

!threadprivate decalred before parallel region construct.
!$omp threadprivate(/thread_data/)
thread_result = 0.d0
subtotal = 10.d0

!$omp parallel default(none) private(tid)
tid = omp_get_thread_num()
thread_result = thread_result + tid * 10.d0
write(*,*) "Thread ", omp_get_thread_num(), " result in region 1 : ", thread_result
!$omp end parallel

write(*,*) " "
write(*,*) "Next, updating the results of all threads using their individual results from previous parallel region ..."
write(*,*) " "

!$omp parallel default(none) private(tid)
thread_result = thread_result + 5.d0
write(*,*) "Thread ", omp_get_thread_num(), " result in region 2 : ", thread_result
if (omp_get_thread_num() == 0) then
    write(*,*) "Master thread ", omp_get_thread_num(), " result in region 2 : ", thread_result
end if
!$omp end parallel 

write(*,*) " "
write(*,*) "Override each thread's value from region 2 using the master thread's value ..."
write(*,*) " "

!$omp parallel default(none) private(tid) copyin(/thread_data/)
tid = omp_get_thread_num()
thread_result = thread_result + tid + subtotal
write(*,*) "Thread ", omp_get_thread_num(), " result in region 3 : thread_id + master thread result + subtotal", thread_result
!$omp end parallel

end program threadprivate