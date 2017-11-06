CODE = ~/Documents/code

CXXFLAGS += -std=c++11 \
    -I $(CODE) \
    -L $(CODE)/ebt \
    -L $(CODE)/util \
    -L $(CODE)/la \
    -L $(CODE)/opt \
    -L $(CODE)/autodiff \
    -L $(CODE)/nn

bin = \
    fc-learn \
    fc-predict

.PHONY: all clean

all: $(bin)

clean:
	-rm *.o
	-rm $(bin)

fc-learn: fc-learn.o
	$(CXX) $(CXXFLAGS) -o $@ $^ -lnn -lautodiff -lopt -lla -lutil -lebt -lblas

fc-predict: fc-predict.o
	$(CXX) $(CXXFLAGS) -o $@ $^ -lnn -lautodiff -lopt -lla -lutil -lebt -lblas
