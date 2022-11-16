# Lattice-Polygons
Updated version of Fortran code used in 2018 to create OEIS A070911 and related sequences.
To run
- download zip file
- unzip
- open a terminal in the target dirctory.
- Execute .\compile nn, where nn is the number of vertices (gfortran needed)
- Change to subdirectory .\nn
- execute "nnw.exe mm" or "nnw.exe mm" where mm is the position of the last segment considered in the spiral lists.
In the example for n=17 mm=34 or mm=42 is a reasonable choice.
