      include '../fortran/head.f'
      parameter (nvertx=27)
      parameter (amiset=vlarge)
      include '../fortran/declar.f'
      include '../fortran/common4.f'
      do 40 n4 = 2, m
      call repeat (4, *40)
      do 50 n5 = 2, m
      call repeat (5, *50)
      do 60 n6 = 2, m
      call repeat (6, *60)
      do 70 n7 = 2, m
      call repeat (7, *70)
      do 80 n8 = 2, m
      call repeat (8, *80)
      do 90 n9 = 2, m
      call repeat (9, *90)
      do 100 n10 = 2, m
      call repeat (10, *100)
      do 110 n11 = 2, m
      call repeat (11, *110)
      do 120 n12 = 2, m
      call repeat (12, *120)
      do 130 n13 = 2, m
      call repeat (13, *130)
      do 140 n14 = 2, m
      call repeat (14, *140)
      do 150 n15 = 2, m
      call repeat (15, *150)
      do 160 n16 = 2, m
      call repeat (16, *160)
      do 170 n17 = 2, m
      call repeat (17, *170)
      do 180 n18 = 2, m
      call repeat (18, *180)
      do 190 n19 = 2, m
      call repeat (19, *190)
      do 200 n20 = 2, m
      call repeat (20, *200)
      do 210 n21 = 2, m
      call repeat (21, *210)
      do 220 n22 = 2, m
      call repeat (22, *220)
      do 230 n23= 2, m
      call repeat (23, *230)
      do 240 n24 = 2, m
      call repeat (24, *240)
      do 250 n25 = 2, m
      call repeat (25, *250)
      do 260 n26 = 2, m
      call repeat (26, *260)
      do 270 n27 = 2, m
      call repeat (27, *270)
      L = 27
      include '../fortran/check.f'
270   u(nn(27)) = .false.
260   u(nn(26)) = .false.
250   u(nn(25)) = .false.
240   u(nn(24)) = .false.
230   u(nn(23)) = .false.
220   u(nn(22)) = .false.
210   u(nn(21)) = .false.
200   u(nn(20)) = .false.
190   u(nn(19)) = .false.
180   u(nn(18)) = .false.
170   u(nn(17)) = .false.
160   u(nn(16)) = .false.
150   u(nn(15)) = .false.
140   u(nn(14)) = .false.
130   u(nn(13)) = .false.
120   u(nn(12)) = .false.
110   u(nn(11)) = .false.
100   u(nn(10)) = .false.
90    u(nn(9)) = .false.
80    u(nn(8)) = .false.
70    u(nn(7)) = .false.
60    u(nn(6)) = .false.
50    u(nn(5)) = .false.
40    u(nn(4)) = .false.
30    u(nn(3)) = .false.
20    u(nn(2)) = .false.
      include '../fortran/tail.f'
