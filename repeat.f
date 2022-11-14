      subroutine repeat (LL, *)
      include 'declar.f'
      integer triar, x1, y1, x2, y2, x3, y3
C Statement function: Double area of triangle
      triar(x1,y1, x2,y2, x3,y3) =
     &      x1*(y2-y3) + x2*(y3-y1) + x3*(y1-y2)
C
      L = LL
C each segment can only occur once in path
C Segment already used in path up to L?
      if (u(nn(L))) return 1
C Lock segment against reuse in continuation of path
      u(nn(L)) = .true.
C try extension by segment from list
      x(L) = x(L-1) + xd(nn(L))
      y(L) = y(L-1) + yd(nn(L))
C area contribution must be positive
      a(L) = triar ( x(1),y(1), x(L-1),y(L-1), x(L),y(L))
      if ( a(L) .le. 0 ) return 1
C left turn?
      if (triar(x(L-2),y(L-2), x(L-1),y(L-1), x(L),y(L)).le.0)return 1
C start point still left of straight line through endpoints of segment?
      if ( triar (x(L),y(L), x(1),y(1), x(2),y(2)) .le. 0 ) return 1
      as(L) = as(L-1) + a(L)
C Enough area margin left?
      if ( as(L) .gt. ami-n+L ) return 1
      return
      end
