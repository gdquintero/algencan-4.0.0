# Set the environment variable ALGENCAN
export ALGENCAN=$HOME/algencan-4.0.0

# Compile the BLAS files and make libblas.a
gfortran -c -O3 $ALGENCAN/sources/blas/dgemm.f
gfortran -c -O3 $ALGENCAN/sources/blas/dgemv.f
gfortran -c -O3 $ALGENCAN/sources/blas/dtpmv.f
gfortran -c -O3 $ALGENCAN/sources/blas/dtpsv.f
gfortran -c -O3 $ALGENCAN/sources/blas/idamax.f
gfortran -c -O3 $ALGENCAN/sources/blas/lsame.f
gfortran -c -O3 $ALGENCAN/sources/blas/xerbla.f

ar rcs libblas.a dgemm.o dgemv.o dtpmv.o dtpsv.o idamax.o lsame.o xerbla.o

# Move the library to sources/blas/lib/
mv libblas.a $ALGENCAN/sources/blas/lib/.

# Remove all the .o files
rm $ALGENCAN/*.o

# Compile the HSL files and make libhsl.a
gfortran -c -O3 $ALGENCAN/sources/hsl/hsl_zd11d.f90
gfortran -c -O3 $ALGENCAN/sources/hsl/hsl_ma57d.f90
gfortran -c -O3 $ALGENCAN/sources/hsl/ma57ad.f
gfortran -c -O3 $ALGENCAN/sources/hsl/mc34ad.f
gfortran -c -O3 $ALGENCAN/sources/hsl/mc47ad.f
gfortran -c -O3 $ALGENCAN/sources/hsl/mc59ad.f
gfortran -c -O3 $ALGENCAN/sources/hsl/mc64ad.f
gfortran -c -O3 $ALGENCAN/sources/hsl/mc21ad.f
gfortran -c -O3 $ALGENCAN/sources/hsl/mc71ad.f
gfortran -c -O3 $ALGENCAN/sources/hsl/fakemetis.f

ar rcs libhsl.a hsl_zd11d.o hsl_ma57d.o ma57ad.o mc34ad.o mc47ad.o \
mc59ad.o mc64ad.o mc21ad.o mc71ad.o fakemetis.o

# Move the library to sources/blas/lib/
mv libhsl.a $ALGENCAN/sources/hsl/lib/.

# Move the hsl_ma57_double.mod files to sources/hsl/inc/
mv hsl_ma57_double.mod $ALGENCAN/sources/hsl/inc/.

# Remove hsl_zd11_double.mod and all the .o files
rm $ALGENCAN/hsl_zd11_double.mod
rm $ALGENCAN/*.o

# Compile Algencan and make libalgencan.a
gfortran -c -O3 -Wall -I$ALGENCAN/sources/hsl/inc $ALGENCAN/sources/algencan/lss.f90
gfortran -c -O3 -Wall $ALGENCAN/sources/algencan/gencan.f90
gfortran -c -O3 -Wall $ALGENCAN/sources/algencan/memev.f90
gfortran -c -O3 -Wall $ALGENCAN/sources/algencan/feasgencan.f90
gfortran -c -O3 -Wall $ALGENCAN/sources/algencan/newtkkt.f90
gfortran -c -O3 -Wall $ALGENCAN/sources/algencan/algencan.f90

ar rcs libalgencan.a lss.o gencan.o memev.o feasgencan.o newtkkt.o algencan.o

# Move the library to sources/algencan/lib/
mv libalgencan.a $ALGENCAN/sources/algencan/lib/.

# Move bmalgencan.mod, bmgencan.mod bmfeasgencan.mod file to sources/algencan/inc/
mv bmalgencan.mod $ALGENCAN/sources/algencan/inc/.
mv bmgencan.mod $ALGENCAN/sources/algencan/inc/.
mv bmfeasgencan.mod $ALGENCAN/sources/algencan/inc/.

# remove bmnewtkkt.mod, memev.mod, lss.mod and all the .o files
rm $ALGENCAN/bmnewtkkt.mod
rm $ALGENCAN/memev.mod
rm $ALGENCAN/lss.mod
rm $ALGENCAN/*.o
