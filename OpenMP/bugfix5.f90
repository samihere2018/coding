! C******************************************************************************
! C FILE: omp_bug6.f
! C DESCRIPTION:
! C   This program compiles and runs fine, but produces the wrong result.
! C   Compare to omp_orphan.f.
! C AUTHOR: Blaise Barney  6/05
! C LAST REVISED: 06/27/05
! C******************************************************************************
! The commented code below has a bug and it's been fixed by the uncommented code below it.
! SOLUTION: add SUM to the common block.

!       PROGRAM ORPHAN
!       COMMON /DOTDATA/ A, B
!       INTEGER I, VECLEN
!       REAL*8 SUM
!       PARAMETER (VECLEN = 100)
!       REAL*8 A(VECLEN), B(VECLEN)

!       DO I=1, VECLEN
!          A(I) = 1.0 * I
!          B(I) = A(I)
!       ENDDO
!       SUM = 0.0
! !$OMP PARALLEL SHARED (SUM)
!       CALL DOTPROD
! !$OMP END PARALLEL
!       WRITE(*,*) "Sum = ", SUM
!       END



!       SUBROUTINE DOTPROD
!       COMMON /DOTDATA/ A, B
!       INTEGER I, TID, OMP_GET_THREAD_NUM, VECLEN
! c     REAL*8 SUM
!       PARAMETER (VECLEN = 100)
!       REAL*8 A(VECLEN), B(VECLEN)

!       TID = OMP_GET_THREAD_NUM()
! !$OMP DO REDUCTION(+:SUM)
!       DO I=1, VECLEN
!          SUM = SUM + (A(I)*B(I))
!          PRINT *, '  TID= ',TID,'I= ',I
!       ENDDO
!       RETURN
!       END


PROGRAM ORPHAN
      COMMON /DOTDATA/ A, B, SUM
      INTEGER I, VECLEN
      REAL*8 SUM
      PARAMETER (VECLEN = 100)
      REAL*8 A(VECLEN), B(VECLEN)

      DO I=1, VECLEN
         A(I) = 1.0 * I
         B(I) = A(I)
      ENDDO
      SUM = 0.0
!$OMP PARALLEL  shared(sum)
      CALL DOTPROD
!$OMP END PARALLEL
      WRITE(*,*) "Sum = ", SUM
      END



      SUBROUTINE DOTPROD
      COMMON /DOTDATA/ A, B, SUM
      INTEGER I, TID, OMP_GET_THREAD_NUM, VECLEN
      PARAMETER (VECLEN = 100)
      REAL*8 SUM
      REAL*8 A(VECLEN), B(VECLEN)

      TID = OMP_GET_THREAD_NUM()
!$OMP DO REDUCTION(+:SUM) 
      DO I=1, VECLEN
         SUM = SUM + (A(I)*B(I))
         PRINT *, '  TID= ',TID,'I= ',I
      ENDDO
!$OMP END DO
      RETURN
      END