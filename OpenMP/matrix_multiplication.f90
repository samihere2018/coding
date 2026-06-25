!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare1.f90
!---You can use export omp_set_num_threads(4) to set the number of threads to say 4, in the terminal without coding.
!---You the command export OMP_NUM_THREADS=4 (CASE SENSITIVE IN MACOS)
!---This program involves the multiplication of two matrices.
!---It's ADVISABLE not to use the nowait clause here because the threads will not wait for each other to finish the loop and this will result in a wrong answer.
!---It's safe to use the nowait caluse after initialising matrix A but do not use it for matrices B and C.

program matrix_multiplication
use omp_lib
implicit none

integer :: i, j, k , n, nra, nrb, ncb, tid, nthreads, chunk, chunksize
parameter (n = 100)
parameter (chunksize = 10)
parameter (nra = 62, nrb = 15, ncb = 7)
real*8 ::A(nra, nrb), B(nrb, ncb), C(nra, ncb)

chunk = chunksize

!$omp parallel default(none) shared(A, B, C, chunk, nthreads) private(i, j, k, tid)
tid = omp_get_thread_num()
if (tid.eq.0) then
    nthreads = omp_get_num_threads()
    print*, "Available number of threads = ", nthreads
    print*, "Initializing matrices A and B"
end if


    !initialize the matrix A 
    !$omp do schedule(dynamic, chunk)
    do j = 1, nrb
        do i = 1, nra
            A(i,j) = (i-1)*(j-1)
        end do
    end do

    !initialize the matrix B
    !$omp do schedule(dynamic, chunk)
    do j = 1,ncb
        do i = 1, nrb
            B(i,j) = (i-1)*(j-1)
        end do
    end do

    !initialize the matrix C
    !$omp do schedule(dynamic, chunk)
    do j = 1,ncb
        do i = 1, nra
            C(i,j) = 0.0d0
        end do
    end do

    !matrix multiplication of A and B to produce C

    print*, "Thread ", tid , " is starting the matrix multiplication ..."
    !$omp do schedule(dynamic, chunk)
    do  j = 1, ncb
        do i = 1, nra
            do k = 1, nrb
                C(i,j) = C(i,j) + A(i,k) * B(k,j)
            end do
        end do
    end do

    !$omp end do
!$omp end parallel

!print results
print *, "********************************************"
do i = 1, nra
    do j = 1, ncb
        write(*,*) "C(", i, ",", j, ") = ", C(i, j)
    end do
end do

end program matrix_multiplication