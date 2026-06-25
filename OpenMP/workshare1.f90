!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare1.f90
!---You can use export omp_set_num_threads(4) to set the number of threads to say 4, in the terminal without coding.
!---You the command export OMP_NUM_THREADS=4 (CASE SENSITIVE IN MACOS)

program workshare1
use omp_lib
implicit none 

integer :: nthreads, tid, n, i, chunk, chunksize
parameter (n=100)
parameter (chunksize=10)
real*8 :: A(n), B(n), C(n)

do i = 1,n
    A(i) = 5.0d0 * i
    B(i) = A(i)
end do

chunk = chunksize
! call omp_set_num_threads(4)

!$omp parallel shared(nthreads, A, B, C, chunk) private(tid, i)
tid = omp_get_thread_num()
if (tid.eq.0) then
    nthreads = omp_get_num_threads()
    print *, "available number of threads = ", omp_get_num_threads()
end if
print *, "Thread ", tid, " starting ..."

!---in this block all threads do the same work but on different data
!$omp do schedule (dynamic, chunk)
do i = 1, n
    C(i) = A(i) + B(i)
    write (*, 100) tid, i , C(i)
100 format (' Thread', I2, ' : C( ', I3, ')=', F8.2)
end do
!$omp end do nowait

print *, "Thread ", tid, " done!"

!$omp end parallel

end program workshare1