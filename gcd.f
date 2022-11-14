      integer function gcd (aa,bb)
      integer aa, bb
      integer a, b, c
      if ( aa .eq. 0 ) then
        if ( bb .eq. 0 ) then
          gcd = 1
        else
          gcd = abs(bb)
        endif
        return
      endif
      if ( bb .eq. 0 ) then
        gcd = abs(aa)
        return
      endif
      IF (aa .lt. bb) THEN
        a = abs(bb)
        b = abs(aa)
      ELSE
        a = abs(aa)
        b = abs(bb)
      ENDIF
10    continue
C      write (*,*) a, b, c
      c = MOD(a, b)
      IF (c .eq. 0) goto 20
      a = b
      b = c
      goto 10
20    continue
      gcd = b
      end
