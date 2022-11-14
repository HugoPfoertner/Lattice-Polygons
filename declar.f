      parameter (ms=2500)
C Length of lists for segments, coordinates, areas
C Must be extended for n>nm
      parameter (nm=27)
      integer xd(ms), yd(ms), s(ms)
     &          , x(nm), y(nm), a(nm), as(nm), nn(nm), xs(nm), ys(nm)
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
      integer n, ami, L
      common /poly/ n, ami, L
