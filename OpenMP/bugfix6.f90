! C******************************************************************************
! C FILE: omp_bug1.f
! C DESCRIPTION:
! C   This example attempts to show use of the PARALLEL DO construct.  However
! C   it will generate errors at compile time.  Try to determine what is causing
! C   the error.  See omp_bug1fix.f for a corrected version.
! C AUTHOR: Blaise Barney  5/99
! C LAST REVISED: 
! C******************************************************************************
! The commented code below has a bug and it's been fixed by the uncommented code below it.
! SOLUTION: The iteration loop should start after the "DO DIRECTIVE" and tid should be defined
!           before the "DO DIRECTIVE" and not inside the loop.
!           The "DO DIRECTIVE" is a worksharing construct that divides the iterations of the loop among the threads in the team.
!       PROGRAM WORKSHARE3

!       INTEGER TID, OMP_GET_THREAD_NUM, N, I, CHUNKSIZE, CHUNK
!       PARAMETER (N=50)
!       PARAMETER (CHUNKSIZE=5) 
!       REAL A(N), B(N), C(N)

! !     Some initializations
!       DO I = 1, N
!         A(I) = I * 1.0
!         B(I) = A(I)
!       ENDDO
!       CHUNK = CHUNKSIZE
            
! !$OMP  PARALLEL DO SHARED(A,B,C,CHUNK) 
! !$OMP& PRIVATE(I,TID) 
! !$OMP& SCHEDULE(STATIC,CHUNK)

!       TID = OMP_GET_THREAD_NUM()
!       DO I = 1, N
!          C(I) = A(I) + B(I)
!          PRINT *,'TID= ',TID,'I= ',I,'C(I)= ',C(I)
!       ENDDO

! !$OMP  END PARALLEL DO

!       END


PROGRAM WORKSHARE3

      INTEGER TID, OMP_GET_THREAD_NUM, N, I, CHUNKSIZE, CHUNK
      PARAMETER (N=50)
      PARAMETER (CHUNKSIZE=5) 
      REAL A(N), B(N), C(N)

!     Some initializations
      DO I = 1, N
        A(I) = I * 1.0
        B(I) = A(I)
      ENDDO
      CHUNK = CHUNKSIZE
            
!$OMP PARALLEL SHARED(A,B,C,CHUNK) PRIVATE(I,TID) 
      TID = OMP_GET_THREAD_NUM()
      !$OMP DO SCHEDULE(STATIC,CHUNK)
      
            DO I = 1, N
            C(I) = A(I) + B(I)
            PRINT *,'TID= ',TID,'I= ',I,'C(I)= ',C(I)
            ENDDO
      !$OMP END DO
!$OMP  END PARALLEL 

      END
