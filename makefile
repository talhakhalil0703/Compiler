CC := g++
CXXFLAGS := -O2 -Wall
EXEC := main

all: main.cpp scanner.cpp
	$(CC) $(CXXFLAGS) -o ${EXEC} $^