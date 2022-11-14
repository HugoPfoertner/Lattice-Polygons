C Update minimum
      if ( as(L) .lt. ami ) then
        count = 0
        ami = as(L)
C
C alternative with exact enclosing circle
C        call encirc ( 1, n, x, y, xc, yc, rc )
C        diamin = 4*rc**2
        call cpu_time (cptime)
C type cast assumed to work diamin (real*8) = diamet (integer)
        call shear (n, x, y, xs, ys, idiami)
        diamin = dble(idiami)
C        diamin = diamet (n,x,y)
        write (*,1000) n, as(L), diamin, (xs(k),ys(k),k=1,n)
1000    format (/,i2, 1X, i0, f14.6, 2x, 27('(',i0,',',i0,')',:,',') )
        write (*,1001) cptime, nn(2:n)
        write (*,1011) ((xs(k)-xs(k-1))**2+(ys(k)-ys(k-1))**2,k=2,n),
     &                 (xs(n)-xs(1))**2+(ys(n)-ys(1))**2
1001    format ( F12.4,     ' s: ',i0, 27(1X,i0,:) )
1011    format ( 5X, 'Lengths^2: ',i0, 27(1X,i0,:) )
      endif
C
C check for multiple solutions with same mimimum area
      if ( as(L) .eq. ami ) then
        call cpu_time (cptime)
        call shear (n, x, y, xs, ys, idia)
        d = dble(idia)
C        d = diamet(n,x,y)
C        call encirc ( 1, n, x, y, xc, yc, rc )
C        d = 4*rc**2
        count = count + 1
        if ( d .lt. diamin ) then
          diamin = d
          write (*,1000) n, as(L), diamin, (xs(k),ys(k),k=1,n)
          write (*,1001) cptime, nn(2:n)
          write (*,1011) ((xs(k)-xs(k-1))**2+(ys(k)-ys(k-1))**2,k=2,n),
     &           (xs(n)-xs(1))**2+(ys(n)-ys(1))**2
        endif
        if ( d .gt. diamax ) then
          diamax = d
          write (*,1000) n, as(L), -diamax, (xs(k),ys(k),k=1,n)
          write (*,1001) cptime, nn(2:n)
          write (*,1011) ((xs(k)-xs(k-1))**2+(ys(k)-ys(k-1))**2,k=2,n),
     &           (xs(n)-xs(1))**2+(ys(n)-ys(1))**2
        endif
      endif
