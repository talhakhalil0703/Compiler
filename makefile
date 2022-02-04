CC := g++
CXXFLAGS := -std=c++14 -O2 -Wall
EXEC := main
OBJS := main.cpp scanner.cpp token.hpp

all: ${OBJS}
	$(CC) $(CXXFLAGS) -o ${EXEC} $^

clean:
	rm -f *.o ${EXEC}