C Number of polygons with minimal area found
      integer*8 count
C File names of external files, command argument
      character*15 bspirx, bspiry, carg
C Progress indicator line
      character pline*150, plin10*10
C CPU time
      real cptime
C function to calculate d^2 of enclosing circle,
C to be replaced by function encirc
C if exact enclosing circle is needed
      integer diamet, gcd, triar
      external diamet, gcd
C variables  needed in diameter calculation
      doubleprecision xc, yc, rc, d, diamin, diamax
C Some choices for OEIS files describing spirals
C Square spiral
C      data bspirx, bspiry /'b174344.txt', 'b274923.txt' /
C Circular rings (Sloane)
C      data bspirx, bspiry /'b283307.txt', 'b283308.txt' /
C Circular rings
      data bspirx, bspiry /'../b305575.txt', '../b305576.txt' /
C Statement function: Double area of triangle
      triar(x1,y1, x2,y2, x3,y3) =
     &      x1*(y2-y3) + x2*(y3-y1) + x3*(y1-y2)
C Progress indicator
      pline = '....+....1....+....2....+....3....+....4....+....5' //
     &  '....+....6....+....7....+....8....+....9....+....A' //
     &  '....+....B....+....C....+....D....+....E....+....F'
      plin10 = '|123456789'
      icha = ichar('a') - 1
C
C read external files with coordinates of points in spiral
C X
      open ( unit=10, file=bspirx, status='old',
     &       form='formatted', iostat=ios)
      if ( ios .ne. 0 ) stop 'Error opening bfile spiral x'
      do 1 i = 1, ms
      read (10,*,end=999) k, xd(i)
1     continue
      close (unit=10)
C Y
      open ( unit=10, file=bspiry, status='old',
     &       form='formatted', iostat=ios)
      if ( ios .ne. 0 ) stop 'Error opening bfile spiral y'
      do 2 i = 1, ms
      read (10,*,end=999) k, yd(i)
2     continue
      close (unit=10)
C eliminate steps (dx,dy) with gcd(dx,dy) > 1
      mms = 1
      do 3 i = 2, ms
      k = gcd (xd(i),yd(i))
      if ( k .eq. 1 ) then
        mms = mms + 1
        xd(mms) = xd(i)
        yd(mms) = yd(i)
C Squared length of segment
        s(mms) = xd(mms)**2 + yd(mms)**2
      endif
3     continue
      write (*,*) 'Segments after gcd elimination:', mms
C
C For convenience: write first nonnegative (x,y) pairs to terminal
      do 4 i = 2, 100
      if (xd(i) .ge. 0 .and. yd(i) .ge. 0 ) write (*,1003)i,xd(i),yd(i)
C Optional output of all segments
C      write (*,1003)i,xd(i),yd(i)
1003  format ( 3 i3 )
4     continue
C
C preset minimum area
      ami = min(vlarge,amiset)
C if an upper bound is known: least area + 1
C      ami = 183
C preset diameter extreme values
      diamin = 1.0D20
      diamax = 0.0D0
C Total number of polygons with same minimum area
      count = 0
C Clear array of "direction used" indicators
      u = .false.
C get number of list items from first parameter of program call
      ncmd = command_argument_count()
      if (ncmd .lt. 1 ) stop
     & 'Length of segment list to be provided as first argument in call''
      CALL get_command_argument(1, carg)
      read (carg, *) m
      if ( m .gt. mms ) stop 'm exceeds length of segment list'
      write (*,*) 'Segments used:', m
C get index of
      n2first = 2
      if (ncmd .ge. 2) then
        CALL get_command_argument(2, carg)
        read (carg, *) n2first
        if ( xd(n2first) .lt. 0  .or. yd(n2first) .lt. 0 )
     &   stop 'illegal negative start step'
      endif
C limit range, assuming first coordinate pair on files is (0,0)
      n2first = max(2,min (m,n2first))
      write (*,*) 'First start step:', xd(n2first), yd(n2first)
      n3first = 3
      if (ncmd .ge. 3) then
        CALL get_command_argument(3, carg)
        read (carg, *) n3first
        if ( n3first .lt. 2 .or. n3first .gt. m )
     &   stop 'illegal 3rd step'
      endif
C
C Start building the polygon
C
      n = nvertx
C Freeze first point
      x(1) = 0
      y(1) = 0
      n1 = 0
C
C loop over second point
      do 20 n2 = n2first, m
      L = 2
      if (u(nn(L))) goto 20
      u(nn(L)) = .true.
      x(L) = xd(nn(L))
      y(L) = yd(nn(L))
C
C Limit to angle 0 <= Pi/2
      if ( x(L) .lt. 0 .or. y(L) .lt. 0 .or. y(L) .gt. x(L) ) goto 20
C
C optional: Exclusion of extremely long segments
C      if (dble(x(L)**2 + y(L)**2) .gt. diamin) goto 20
      write (*,1006) count, n2, xd(nn(L)), yd(nn(L))
1006  format (/,'Min area polygons found so far: ', i0,
     & ', next n2 = ', i0, ' (',i0,',',i0,')')
C if wanted: progress indicator 
      WRITE(*, 1004, ADVANCE='NO') pline(1:1)
1004  format (A1)

C loop over third point
      do 30 n3 = n3first, m
C Progress indicator
      if ( n3 .le. 150 ) then
        WRITE(*, 1004, ADVANCE='NO') pline(n3:n3)
      else
        if (mod(n3,100) .eq. 0) then
          WRITE(*, 1004, ADVANCE='NO') char(icha+n3/100)
        else
          WRITE(*, 1004, ADVANCE='NO')
     &    plin10(mod(n3,10)+1:mod(n3,10)+1)
        endif
      endif
      L = 3
      if (u(nn(L))) goto 30
      u(nn(L)) = .true.
      x(L) = x(L-1) + xd(nn(L))
      y(L) = y(L-1) + yd(nn(L))
C Diagnostic output
C      write (*,*) nn(L), xd(nn(L)), yd(nn(L))
      a(L) = triar (x(1),y(1), x(L-1),y(L-1), x(L),y(L))
      as(L) = a(L)
      if ( a(L) .le. 0 ) goto 30
      if ( a(L) .gt. ami-n+L ) goto 30
C The following blocks are repeated in code with adaptation for
C current segment number (code easily generated by a small script
C or preprocessor)
C      call repeat (4, *40)
