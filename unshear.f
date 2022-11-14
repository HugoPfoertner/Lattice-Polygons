      subroutine shear (n, x, y, xu, yu, d)
C reduce n points to minimum diameter applying shear transformations
C on the coordinates
C Author: Hugo Pfoertner http://www.pfoertner.org
C Version history:
C 2022-11-11 Initial version
C
      implicit integer (a-z)
      dimension x(n), y(n), xu(n), yu(n)
      parameter (nmax=100)
      parameter (vlarge=2147483647)
      external diamet
C Auxiliary copy of coordinates
      dimension xs(nmax), ys(nmax)
C
      logical success
C Check dimension
      if ( n .gt. nmax ) stop 'n too large'
C
      xu = x
      yu = y
1     continue
C output in normalized position
       call zerop (n,xu,xma)
       call zerop (n,yu,yma)
C
C Diameter of start configuration
      d = diamet (n, xu, yu)
C
      success = .false.
      if ( xma .gt. yma ) then
C try shearing parallel to x axis
C positive shear
100   continue
      do 110 i = 1, n
      xs(i) = xu(i) + yu(i)
110   continue
      ds = diamet (n, xs, yu)
      if (ds .lt. d) then
        d = ds
        xu = xs(1:n)
        success = .true.
        call zerop (n,xu,xma)
      endif
200   continue
C negative shear only when positive shear found no improvement
      if ( .not. success ) then
      do 210 i = 1, n
      xs(i) = xu(i) - yu(i)
210   continue
      ds = diamet (n, xs, yu)
      if (ds .lt. d) then
        d = ds
        xu = xs(1:n)
        success = .true.
        call zerop (n,xu,xma)
      endif
      endif
C
      else
C try shearing parallel to y axis
C positive shear
300   continue
      do 310 i = 1, n
      ys(i) = yu(i) + xu(i)
310   continue
      ds = diamet (n, xu, ys)
      if (ds .lt. d) then
        d = ds
        yu = ys(1:n)
        success = .true.
        call zerop (n, yu, yma)
      endif
      if ( .not. success ) then
400   continue
      do 410 i = 1, n
      ys(i) = yu(i) - xu(i)
410   continue
      ds = diamet (n, xu, ys)
      if (ds .lt. d) then
        d = ds
        yu = ys(1:n)
        success = .true.
        call zerop (n, yu, yma)
      endif
      endif
      endif
C try again until no shear finds a smaller diameter
      if (success) goto 1
      end
C
      subroutine zerop (n, x, xmax)
C translate array to zero minimum
      integer n, x(n), xmax
      integer xmi, xma
      xmi = 2147483647
      xma = -xmi
      do 10 i = 1, n
      xmi = min (xmi, x(i))
      xma = max (xma, x(i))
10    continue
      do 20 i = 1, n
      x(i) = x(i) - xmi
20    continue
      xmax = xma - xmi
      end
