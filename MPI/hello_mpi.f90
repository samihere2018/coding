!compile this code as *** mpif90 -o hello_mpi.exe hello_mpi.f90***
!run teh excutable *** mpirun -np 4(this is depending on the number of processors you have on your system) ./hello_mpi.exe ***

program hello_mpi
use mpi_f08
implicit none


type(mpi_comm) :: world_comm
integer :: rank, nprocs, ierror

!initialise mpi environment
call MPI_init(ierror)

!mpi global communicator
world_comm = MPI_COMM_WORLD

!get the ID (rank) of the process
!the third argument below is optional
call MPI_COMM_RANK(world_comm,rank, ierror)

!get the number of processes running
call MPI_COMM_SIZE(world_comm, nprocs, ierror)

!print identity of the process
print*, "Hello from process ", rank, " out of ", nprocs

!finalise MPI environment before exiting

call MPI_FINALIZE(ierror)













end program hello_mpi
