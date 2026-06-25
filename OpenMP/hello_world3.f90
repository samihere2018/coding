!Author: Sylvia Amihere 
! A simple OpenMP program in Fortran to print "Hello, world!" from multiple threads
! Compilation: gfortran -fopenmp -o hello_world hello_world.f90
program hello
!use OpenMP library to access OpenMP functions
!by using the library you do not need to declare the omp functions you want to use
use omp_lib

!all varaibles must be declared
implicit none 

integer:: nthreads, tid

!fork a team of threads with each thread having its own private tid variable
!if you use default(none), the omp library will throw an error for undeclared variables (unless they are declared as shared or private)

! declare the number of threads to be used in the parallel region
call omp_set_num_threads(6)

!$omp parallel default(none) shared(nthreads) private(tid)
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