#include "scanner.hpp"

void Scanner::ReadFromFile(std::string file_address)
{
    // char character;

    std::ifstream ifs;

    ifs.open(file_address, std::ifstream::in);

    if (ifs.is_open())
    {
        char c = ifs.get();

        while (ifs.good())
        {
            if (c == ' ')
            {
            }
            else
            {
                std::cout << c;
            }
            c = ifs.get();
        }

        ifs.close();
    }
    else
    {
        std::cerr << "Could not read file: \"" << file_address << "\" \n";
    }
    return;
}