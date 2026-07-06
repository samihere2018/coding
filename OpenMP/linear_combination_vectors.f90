!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This computes the linear combination of vectors using OpenMP directives.
!---You cna modified the code modify the code to use as many vectors or scalrs as you want.
!---The vectors in this case are the rows of the matrix *** matrixA ***.
!---The scalars are the entries of the row vector *** vectorB ***
!---The number of columns in matrixA must be equal to the number of entries in vectorB.

program linear_combination
use omp_lib
implicit none

real*8, allocatable :: matrixA(:, :), vectorB(:), result(:)
integer :: nrowsA, ncolsA, nrowsB, chunksize, i, j, tid
real*8 :: start_time, end_time, thread_duration

nrowsA = 4
ncolsA = 5
nrowsB = ncolsA

if (ncolsA .ne. nrowsB) then
    write(*,*) "ERROR: the number of columns in matrixA must be equal to the number of entries in vectorB"
    stop
end if

allocate(matrixA(nrowsA, ncolsA), vectorB(nrowsB), result(nrowsA))
matrixA = 0.d0
vectorB = 0.d0
result = 0.d0
chunksize = 2

!$omp parallel do default(none) shared(matrixA, vectorB, result, chunksize, nrowsA, ncolsA, nrowsB) private(i, j) schedule(dynamic, chunksize)
do i = 1, nrowsA
    do j = 1, ncolsA
        matrixA(i, j) = 5.d0 *(i+j)
    end do
end do
!$omp end parallel do


!$omp parallel do default(none) shared(matrixA, vectorB, result, chunksize, nrowsA, ncolsA, nrowsB) private(i, j) schedule(dynamic, chunksize)
do i = 1, nrowsB
    vectorB(i) = 5.d0 * (i +2.d0)
end do
!$omp end parallel do


!$omp parallel default(none) shared(matrixA, vectorB, result, nrowsA, ncolsA, nrowsB) private(i, j, tid,start_time, end_time, thread_duration) 
tid = omp_get_thread_num()
start_time = omp_get_wtime()
!$omp do schedule(static)
do i = 1, nrowsA
    do j = 1, ncolsA
        result(i) = result(i) + ( vectorB(j) * matrixA(i, j) )
    end do
end do
!$omp end do
end_time = omp_get_wtime()
thread_duration = end_time - start_time
write(*,*) "Thread ", tid, " : duration = ", thread_duration
!$omp end parallel 

write(*,*) "The linear combination of the vectors is: "
do i = 1, nrowsA
    write(*,*) "result(", i, ")=", result(i)
end do

deallocate(matrixA, vectorB, result)
end program linear_combination