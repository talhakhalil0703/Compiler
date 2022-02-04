#include "scanner.hpp"

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

    Scanner scanner = Scanner(&file);

    auto lexer = std::make_unique<Scanner>(&file);

    Token tok;

    // Get tokens until EOF
    while ((tok = lexer->Scan()) != Token::T_EOF)
    {
        std::cout << "Line: " << lexer->GetLine() << " Token: "
                  << getName(tok) << lexer->GetLexeme() << "\n";
    }

    return EXIT_SUCCESS;
}