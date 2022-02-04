#include "scanner.hpp"

int main(int argc, char *argv[])
{

    Scanner scanner = Scanner();
    scanner.ReadFromFile(argv[1]);

    return 0;
}