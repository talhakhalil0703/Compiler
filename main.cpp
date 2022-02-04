#include "scanner.hpp"

int main(int argc, char *argv[])
{
    std::istream *input;
    std::fstream file;

    if (argc != 2)
    {
        std::cerr << "Incorrect arguments provided, usage: /main [filename] \n";
        return EXIT_FAILURE;
    }

    file.open(argv[1]);
    if (!file.is_open())
    {
        std::cerr << "Could not open file: \"" << argv[1] << "\"";
        return EXIT_FAILURE;
    }

    input = &file;

    Scanner scanner = Scanner(input);

    auto lexer = std::make_unique<Scanner>(input);

    Token tok;

    // Get tokens until EOF
    while ((tok = lexer->Scan()) != Token::T_EOF)
    {
        std::cout << "Line: " << lexer->GetLine() << " Token: "
                  << getName(tok) << lexer->GetLexeme() << "\n";
    }

    return EXIT_SUCCESS;
}