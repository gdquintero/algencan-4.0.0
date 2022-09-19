all: algencanma.o
	$(FC) $(FFLAGS) algencanma.o -L$(BLASSRC)/lib -L$(HSLSRC)/lib -L$(ALGSRC)/lib -lalgencan -lhsl -lblas -o algencanma
	mkdir -p $(BIN)/examples
	mv algencanma $(BIN)/examples


%.o: %.f90
	$(FC) $(FFLAGS) -I$(ALGSRC)/inc -c -o $@ $<

clean:
	rm -f algencanma.o

distclean: clean
	rm -f $(BIN)/examples/algencanma
