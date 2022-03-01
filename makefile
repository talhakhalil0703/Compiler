CC := g++
CXXFLAGS := -std=c++14 -Wall -O2
EXEC := main
OBJS := main.cpp scanner.cpp token.hpp errorhandler.cpp errorhandler.hpp scanner.hpp parser.cpp parser.hpp tree.hpp

all: ${OBJS}
	$(CC) $(CXXFLAGS) -o ${EXEC} $^

clean:
	rm -f *.o ${EXEC}