C     Fixed-form Fortran highlighting sample
      PROGRAM FIXED
      INTEGER I, TOTAL
      TOTAL = 0
      DO 100 I = 1, 10
      TOTAL = TOTAL +
     1 I
  100 CONTINUE
      PRINT *, 'TOTAL = ', TOTAL
      END
