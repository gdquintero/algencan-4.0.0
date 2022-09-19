ALGENCAN := algencan.o feasgencan.o gencan.o lss.o memev.o newtkkt.o

all: lib

lib: $(ALGENCAN)
	$(AR) rcs ./lib/libalgencan.a $(ALGENCAN)
	mv bmalgencan.mod ./inc/
	mv bmgencan.mod ./inc/
	mv bmfeasgencan.mod ./inc/

%.o: %.f90
	$(FC) $(FFLAGS) -I$(HSLSRC)/inc -c -o $@ $<

algencan.o: algencan.f90 lss.o newtkkt.o gencan.o feasgencan.o

feasgencan.o: feasgencan.f90 lss.o memev.o gencan.o

gencan.o: gencan.f90 lss.o

newtkkt.o: newtkkt.f90 lss.o memev.o

clean:
	rm -f *.o *.mod

distclean: clean
	rm -f ./lib/libalgencan.a
	rm -f ./inc/bmalgencan.mod ./inc/bmgencan.mod ./inc/bmfeasgencan.mod
