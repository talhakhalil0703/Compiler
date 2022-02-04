//Code adapted from what Shankar Ganesh (TA) provided in tutorials
#ifndef SCANNER
#define SCANNER
#include <string>
#include <cstring>
#include <iostream>
#include <fstream>
#include <memory>
#include "token.hpp"

class Scanner
{
public:
    Scanner(std::istream *input);
    ~Scanner() = default;

    int GetLine() { return line_number; };
    std::string GetLexeme() { return lexeme; };
    Token Scan();

protected:
    int line_number;
    Token curr_token;
    std::string lexeme;

private:
    std::istream *in;

    void identifier();
    void is_reserved();
    void number();
    void illegal(char c);
    void comment_state();
    void special();
    bool is_special(char c);
};

#endif