#include "scanner.hpp"

void Scanner::ReadFromFile(std::string file_address)
{
    std::string line;

    std::ifstream read_file;
    read_file.open(file_address);
    if (read_file.is_open())
    {
        while (std::getline(read_file, line))
        {
            std::cout << line << '\n';
        }
        read_file.close();
    }
    else
    {
        std::cerr << "Could not read file " << file_address << "\n";
    }
    return;
}