CC := g++
CXXFLAGS := -std=c++14 -Wall -g
EXEC := main
OBJS := src/main.cpp src/scanner.cpp src/token.hpp src/errorhandler.cpp src/errorhandler.hpp src/scanner.hpp src/parser.cpp src/parser.hpp src/tree.hpp src/semantic.cpp src/semantic.hpp

all: ${OBJS}
	$(CC) $(CXXFLAGS) -o ${EXEC} $^

clean:
	rm -f *.o ${EXEC}