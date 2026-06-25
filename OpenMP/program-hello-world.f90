!Author: Sylvia Amihere 
! A simple OpenMP program in Fortran to print "Hello, world!" from multiple threads
! Compilation: gfortran -fopenmp -o hello_world hello_world.f90
program hello_world
    !include this library to use OpenMP functions
    use omp_lib
    implicit none
    integer:: i, thread_id, total_threads

    call omp_set_num_threads(10)
    
     !$omp parallel
        print *, "Hello world from thread", omp_get_thread_num(), "out of", omp_get_num_threads()
     !$omp end parallel
    
end program hello_world