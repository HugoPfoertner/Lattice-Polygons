      integer function diamet (n, x, y)
C Maximum of mutual point distance sufficient as an estimate.
C Exact enclosing circle needs a more sophisticated method,
C e.g., Welz's algorithm
      integer n, x(*), y(*)
      id = 0
      do 10 i = 1, n-1
      do 20 j = i+1, n
      jd = (x(i)-x(j))**2 + (y(i)-y(j))**2
      id = max (id,jd)
20    continue
10    continue
      diamet = id
      end
