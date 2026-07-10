!---Author: Sylvia Amihere 
!---An OpenMP program in Fortran demonstrating work and sharing of variables among threads
!---the nowait clause allows threads to continue without waiting for other threads to finish the loop
!---dynamic scheduling allows threads to pick up the next available chunk of iterations when they finish their current chunk
!---static scheduling divides the iterations into equal sized chunks and assigns them to threads. Each thread does exactly the same number of iterations. 
!---Compilation: gfortran -fopenmp -o dummyname workshare2.f90
!---This program prints out the OpenMP environment information.
!---

program omp_environmentInfo
implicit none

integer :: i, tid, procs, num_threads, max_threads, in_par, dynamic, nested
integer :: omp_get_num_procs, omp_get_thread_num, omp_get_num_threads, omp_get_max_threads, omp_in_parallel, omp_get_dynamic, omp_get_nested


!$omp parallel private(i, tid, num_threads)
    tid = omp_get_thread_num()

    if (tid.eq.0) then 
        print *, " The master thread will print the environment information."

        !get environment information
        procs = omp_get_num_procs()
        num_threads = omp_get_num_threads()
        max_threads = omp_get_max_threads()
        in_par = omp_in_parallel()
        dynamic = omp_get_dynamic()
        nested = omp_get_nested()

        !print environment information
        print *, "Number of processors available on this machine: ", procs
        print *, "Number fo threads availbable in the parallel region: ", num_threads
        print *, "Maximum number of threads you can use : ", max_threads
        print *, "Is the current thread in an active parallel region?", in_par
        print *, " Can we adjust the number of threads dynamically in the parallel region?", dynamic
        print *, " Is nested parallelism enabled?", nested
    end if

    !$omp end parallel
end program omp_environmentInfo


