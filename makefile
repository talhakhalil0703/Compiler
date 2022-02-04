CC := g++
CXXFLAGS := -std=c++14 -O2 -Wall -g
EXEC := main
OBJS := main.cpp scanner.cpp token.hpp

all: ${OBJS}
	$(CC) $(CXXFLAGS) -o ${EXEC} $^

clean:
	rm -f *.o ${EXEC}