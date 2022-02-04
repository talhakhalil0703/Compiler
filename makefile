CC := g++
CXXFLAGS := -O2
EXEC := main

all: main.cpp
	$(CC) $(CXXFLAGS) -o ${EXEC} $^