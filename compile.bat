mkdir %1
move %1w.f .\%1\%1w.f
gfortran -o .\%1\%1w.exe -Ofast .\%1\%1w.f repeat.f unshear.f diamet.f gcd.f