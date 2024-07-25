setenv('MW_MINGW64_LOC','C:\TDM-GCC-64')
mex combiner.c;
mex hyddelayv3.c;
mex asm1.c;
mex settler1dv4.c;
mex carboncombiner.c;