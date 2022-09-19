AR := ar
FC := gfortran

FFLAGS := -O3

ALGENCAN := $(CURDIR)
BIN      := $(ALGENCAN)/bin
SRC      := $(ALGENCAN)/sources
ALGSRC   := $(SRC)/algencan
BLASSRC  := $(SRC)/blas
HSLSRC   := $(SRC)/hsl
INTERSRC := $(SRC)/interfaces

export

all: blas hsl
	make -C $(ALGSRC) all

cutest: algencan
	$(MAKE) -C $(INTERSRC)/cutest all

example: algencan
	make -C $(SRC)/examples all

blas:
	make -C $(BLASSRC) all

hsl:
	make -C $(HSLSRC) all

clean:
	make -C $(ALGSRC) clean
	make -C $(BLASSRC) clean
	make -C $(HSLSRC) clean
	make -C $(INTERSRC)/cutest clean
	make -C $(SRC)/examples clean

distclean:
	make -C $(ALGSRC) distclean
	make -C $(BLASSRC) distclean
	make -C $(HSLSRC) distclean
	make -C $(INTERSRC)/cutest distclean
	make -C $(SRC)/examples distclean
