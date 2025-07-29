! A simple program that computes the value of pi using numerical integration.
! Source: Prof Daniel Reynolds' Lecture 2 Parallel Computing Notes on Fortran 

Program Compute_PI
!--------------------------------------------------
! Description:
! Computes pi through numerical integration via
! pi = 4*int_0^1 1/(1+x^2) dx
! We use a simple midpoint rule for integration,
! over subintervals of fixed size 1/n, where n
! is a user-input parameter.
!--------------------------------------------------
    implicit none

    ! Declare Variables
    integer :: n, i 
    double precision  :: x, a, h, f, my_pi, err_pi, stime, ftime, rtime
    double precision, parameter :: pi = 3.14159265358979323846d0

    !======= Internals ============
    ! set the integrand function
    f(a) = 4.d0 / (1.d0 + (a*a))

    !input the number of intervals
    write(*,*) "Enter the number of intervals (0 quits):"
    read(*,*) n 
    if (n.lt.1) then
      print*, "The number of intervals must be a postive integer."
      stop 
    end if

    !start timer
    call cpu_time(stime)

    !set the subinterval width
    h = 1.d0/n 

    !perform integration
    my_pi = 0.d0
    do i = 1,n 
        x = h * (i - 0.5d0)
        my_pi = my_pi + h * f(x)
    end do

    err_pi = abs(pi - my_pi)

    !end timer
    call cpu_time(ftime)

    !total runtime 
    rtime = ftime - stime

    write(*,*) "   Computed pi  :", my_pi
    write(*,*) "   True pi      : ", pi
    write(*,*) "   Error        : ", err_pi
    write(*,*) "   Total runtime: ", rtime

End program Compute_PI


