#include "scanner.hpp"
#include "parser.hpp"
#include "tree.hpp"
int main(int argc, char *argv[])
{
    std::fstream file;

    if (argc != 2)
    {
        std::cerr << "Incorrect arguments provided, usage: /main [filename] \n";
        return EXIT_FAILURE;
    }

    file.open(argv[1], std::ios::in);
    if (!file.is_open())
    {
        std::cerr << "Could not open file: \"" << argv[1] << "\"";
        return EXIT_FAILURE;
    }

    auto parser = std::make_unique<Parser>(&file);
    Tree program = parser->parse();
    program.print(0);

    return EXIT_SUCCESS;
}