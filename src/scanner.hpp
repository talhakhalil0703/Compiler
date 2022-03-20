//Code adapted from what Shankar Ganesh (TA) provided in tutorials
#ifndef SCANNER
#define SCANNER
#include <string>
#include <cstring>
#include <sstream>
#include <iostream>
#include <fstream>
#include <memory>
#include "token.hpp"
#include "errorhandler.hpp"

class Scanner
{
public:
    Scanner(std::istream *input);
    ~Scanner() = default;

    int GetLine() { return line_number; };
    std::string GetLexeme();
    Token Scan();

protected:
    int line_number;
    Token curr_token;
    ErrorHandler error_handler = ErrorHandler();
    std::string lexeme;

private:
    std::istream *in;

    void identifier();
    void is_reserved();
    void number();
    void illegal(char c);
    void comment_state();
    void string_state();
    void special();
    bool is_special(char c);
};

#endif