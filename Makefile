IDIR =/usr/include/opencv4
CFLAGS=-I$(IDIR) 

ODIR=obj
LDIR =lib

LIBS=-lopencv_core  -lopencv_imgproc -lopencv_highgui -lopencv_imgcodecs

_DEPS = 
DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

_OBJ = imageSegmentation.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))


$(ODIR)/%.o: %.cpp $(DEPS)
	$(CXX) -c -o $@ $< $(CFLAGS)

iseg: $(OBJ)
	$(CXX) -o $@ $^ $(CFLAGS) $(LIBS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o *~ core $(INCDIR)/*~ 