! A simple program that computes the dot product of two vectors.
! Source: Prof Daniel Reynolds' Lecture 2 Parallel Computing Notes on Fortran 
program Driver

!Declarations
implicit none
integer :: n, i, ierr
double precision, allocatable :: u(:), v(:) 
double precision :: sum

print*, "Enter the vector length: "
read*, n
print*, "          Vector length: ", n

allocate(u(1:n))
allocate(v(1:n))

!initialise the vectors as zero vectors
u = 0.d0
v = 0.d0

!the entries of the vectors
do i = 1,n
  u(i) = i
  v(i) = n - i + 1
end do

!compute the dot product of the vectors
sum = 0.d0
do i = 1,n
  sum = sum + (u(i)*v(i))
end do

print*, " Dot product of u and v: ", sum

deallocate(u,v)
end program Driver
