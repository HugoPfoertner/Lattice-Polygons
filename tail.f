C
      call cpu_time ( cptime )
      write (*,1007) cptime, count
1007  format (/,'CPU time: ', f12.4, ' s',/,
     &        'Number of polygons with minimum area: ', i0)
999   continue
      end
