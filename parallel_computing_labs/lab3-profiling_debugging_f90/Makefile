###################################################################
#  Makefile for Lab 3
#
#  Daniel R. Reynolds
#  SMU Mathematics
#  Math 4370 / 6370
###################################################################

all : driver1.exe driver2.exe

driver1.exe : driver1.f90 vectors.f90 get_time.f90 Makefile
	gfortran -O3 driver1.f90 vectors.f90 get_time.f90 -p -o driver1.exe

driver2.exe : driver2.f90 tridiag_matvec.f90 Makefile
	gfortran -O3 driver2.f90 tridiag_matvec.f90 -g -o driver2.exe

####### End of Makefile #######
