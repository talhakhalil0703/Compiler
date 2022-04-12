#include "scanner.hpp"
#include "parser.hpp"
#include "tree.hpp"
#include "semantic.hpp"
#include "synthesize.hpp"
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
    Semantic semantic_analysis = Semantic(program);
    program.print(0);
    auto synt = Synthesis(semantic_analysis, semantic_analysis.program);


    std::string s= ".s";
    std::string output = argv[1] + s;
    std::ofstream output_file;
    output_file.open(output);
    output_file << synt.data << std::endl;
    output_file << synt.text << std::endl;
    output_file.close();
    
    return EXIT_SUCCESS;
}