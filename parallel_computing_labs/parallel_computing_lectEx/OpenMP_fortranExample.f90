!Programmer: Sylvia Amihere
!Date : 22nd August 2025
!Description: A simple OpenMP program in GFortran
!Source: Online example
!Execution: gfortran -fopenmp -o dummyname OpenMP_fortranExample.f90 
!           ./dummyname

Program OpenMP_Example

    !Declarations
    use OMP_LIB
    implicit none

    ! Specify the number of threads in parentheses
    call OMP_SET_NUM_THREADS(10)

    !$omp parallel
    print*, " ""Hello, world!"" from thread ", OMP_GET_THREAD_NUM() 
    !$omp end parallel

End Program OpenMP_Example