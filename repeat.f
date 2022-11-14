      subroutine repeat (LL, *)
C      include 'declar.f'
      parameter (ms=2500)
C Length of lists for segments, coordinates, areas
C Must be extended for n>nm
      parameter (nm=27)
      integer xd(ms), yd(ms), s(ms)
     &          , x(nm), y(nm), a(nm), as(nm), nn(nm)
      logical u(ms)
      common /psteps/ xd, yd, s, x, y, a, as, nn, u
      equivalence
     &  (n1,nn(1)),(n2,nn(2)),(n3,nn(3)),(n4,nn(4)),(n5,nn(5)),
     &  (n6,nn(6)),(n7,nn(7)),(n8,nn(8)),(n9,nn(9)),(n10,nn(10)),
     &  (n11,nn(11)),(n12,nn(12)),(n13,nn(13)),(n14,nn(14)),
     &  (n15,nn(15)),(n16,nn(16)),(n17,nn(17)),(n18,nn(18)),
     &  (n19,nn(19)),(n20,nn(20)),(n21,nn(21)),(n22,nn(22)),
     &  (n23,nn(23)),(n24,nn(24)),(n25,nn(25)),(n26,nn(26)),
     &  (n27,nn(27))
      integer n, ami
      integer triar, x1, y1, x2, y2, x3, y3
      common /poly/ n, ami
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
