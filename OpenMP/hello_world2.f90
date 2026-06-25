!Author: Sylvia Amihere 
! A simple OpenMP program in Fortran to print "Hello, world!" from multiple threads
! Compilation: gfortran -fopenmp -o hello_world hello_world.f90
program hello
!all varaibles must be declared
implicit none 

!if you do not use the omp library you have to decalre the omp functions you want to use
integer :: nthreads, tid, omp_get_num_threads, omp_get_thread_num

!declare the number of threads to be used in the parallel region
call omp_set_num_threads(7)

!fork a team of threads with each thread having its own private tid variable
!if you do not not use default(none), the omp library will assume undeclared variables are shared (unless they are declared as private)

!$omp parallel private(tid)

!obtain the tid of a thread
tid = omp_get_thread_num()
print*, "hello world from thread = ", tid

!only the master thread can tell us the total number of threads
if (tid .eq. 0) then
nthreads = omp_get_num_threads()
print*, "available number of threads = ", nthreads
end if

! all threads join master thread and disband
!$omp end parallel

end program hello