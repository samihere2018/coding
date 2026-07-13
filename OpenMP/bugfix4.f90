! C******************************************************************************
! C FILE: omp_bug5.f
! C DESCRIPTION:
! C   Using SECTIONS, two threads initialize their own array and then add 
! C   it to the other's array, however a deadlock occurs.
! C AUTHOR: Blaise Barney  01/09/04
! C LAST REVISED:
! C******************************************************************************
!
! The commented code below has a bug and it's been fixed by the uncommented code below it.
! SOLUTION: Lock A and B in each section Let each section finish the initialization of its own array
!           and then add it to the other array. Locks forces the threads to wait until the other thread 
!           has finished its initialization before adding it to the other array. Locks force threads to take turns.
!
!       PROGRAM BUG5
     
!       INTEGER*8 LOCKA, LOCKB
!       INTEGER NTHREADS, TID, I, 
!      +        OMP_GET_NUM_THREADS, OMP_GET_THREAD_NUM
!       PARAMETER (N=1000000)
!       REAL A(N), B(N), PI, DELTA
!       PARAMETER (PI=3.1415926535)
!       PARAMETER (DELTA=.01415926535)

! C     Initialize the locks
!       CALL OMP_INIT_LOCK(LOCKA)
!       CALL OMP_INIT_LOCK(LOCKB)

! C     Fork a team of threads giving them their own copies of variables
! !$OMP PARALLEL SHARED(A, B, NTHREADS, LOCKA, LOCKB) PRIVATE(TID)

! C     Obtain thread number and number of threads
!       TID = OMP_GET_THREAD_NUM()
! !$OMP MASTER
!       NTHREADS = OMP_GET_NUM_THREADS()
!       PRINT *, 'Number of threads = ', NTHREADS
! !$OMP END MASTER
!       PRINT *, 'Thread', TID, 'starting...'
! !$OMP BARRIER

! !$OMP SECTIONS

! !$OMP SECTION
!       PRINT *, 'Thread',TID,' initializing A()'
!       CALL OMP_SET_LOCK(LOCKA)
!       DO I = 1, N
!          A(I) = I * DELTA
!       ENDDO
!       CALL OMP_SET_LOCK(LOCKB)
!       PRINT *, 'Thread',TID,' adding A() to B()'
!       DO I = 1, N
!          B(I) = B(I) + A(I)
!       ENDDO
!       CALL OMP_UNSET_LOCK(LOCKB)
!       CALL OMP_UNSET_LOCK(LOCKA)

! !$OMP SECTION
!       PRINT *, 'Thread',TID,' initializing B()'
!       CALL OMP_SET_LOCK(LOCKB)
!       DO I = 1, N
!          B(I) = I * PI
!       ENDDO
!       CALL OMP_SET_LOCK(LOCKA)
!       PRINT *, 'Thread',TID,' adding B() to A()'
!       DO I = 1, N
!          A(I) = A(I) + B(I)
!       ENDDO
!       CALL OMP_UNSET_LOCK(LOCKA)
!       CALL OMP_UNSET_LOCK(LOCKB)

! !$OMP END SECTIONS NOWAIT

!       PRINT *, 'Thread',TID,' done.'

! !$OMP END PARALLEL

!       END


PROGRAM BUG5
     
      INTEGER*8 LOCKA, LOCKB
      INTEGER NTHREADS, TID, I, OMP_GET_NUM_THREADS, OMP_GET_THREAD_NUM
      PARAMETER (N=1000000)
      REAL A(N), B(N), PI, DELTA
      PARAMETER (PI=3.1415926535)
      PARAMETER (DELTA=.01415926535)

!     Initialize the locks
      CALL OMP_INIT_LOCK(LOCKA)
      CALL OMP_INIT_LOCK(LOCKB)

!     Fork a team of threads giving them their own copies of variables
!$OMP PARALLEL SHARED(A, B, NTHREADS, LOCKA, LOCKB) PRIVATE(TID)

!     Obtain thread number and number of threads
      TID = OMP_GET_THREAD_NUM()
!$OMP MASTER
      NTHREADS = OMP_GET_NUM_THREADS()
      PRINT *, 'Number of threads = ', NTHREADS
!$OMP END MASTER
      PRINT *, 'Thread', TID, 'starting...'
! all threads must wait until all threads have started before proceeding to the next step      
!$OMP BARRIER

!$OMP SECTIONS

!$OMP SECTION
      PRINT *, 'Thread',TID,' initializing A()'
      CALL OMP_SET_LOCK(LOCKA)
      DO I = 1, N
         A(I) = I * DELTA
      ENDDO
      CALL OMP_UNSET_LOCK(LOCKA)
      ! The thread in this section cannot do B=B+A until the thread holding lockB has finished initializing B. 
      ! So the thread in this section must wait until the other thread has finished initializing B before it can add A to B.
      CALL OMP_SET_LOCK(LOCKB)
      PRINT *, 'Thread',TID,' adding A() to B()'
      DO I = 1, N
         B(I) = B(I) + A(I)
      ENDDO
      CALL OMP_UNSET_LOCK(LOCKB)
      

!$OMP SECTION
      PRINT *, 'Thread',TID,' initializing B()'
      CALL OMP_SET_LOCK(LOCKB)
      DO I = 1, N
         B(I) = I * PI
      ENDDO
      CALL OMP_UNSET_LOCK(LOCKB)
      ! The thread in this section cannot do A=A+B until the thread holding lockA has finished initializing A.
      ! So the thread in this section must wait until the other thread has finished initializing A before it can add B to A.
      CALL OMP_SET_LOCK(LOCKA)
      PRINT *, 'Thread',TID,' adding B() to A()'
      DO I = 1, N
         A(I) = A(I) + B(I)
      ENDDO
      CALL OMP_UNSET_LOCK(LOCKA)
     
!$OMP END SECTIONS NOWAIT

      PRINT *, 'Thread',TID,' done.'

!$OMP END PARALLEL

      END