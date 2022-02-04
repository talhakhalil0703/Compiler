//Code adapted from what Shankar Ganesh (TA) provided in tutorials
#include "scanner.hpp"

Scanner::Scanner(std::istream *input)
{
    in = input;
    line_number = 1;
}

Token Scanner::Scan()
{
    while (!in->eof())
    {

        lexeme.clear();
        char c = in->peek();
        if (c == '\n')
        {
            line_number++;
            in->get();
        }
        else if (isspace(c))
        {
            in->get();
        }
        else if (isalpha(c) || c == '_')
        {
            identifier();
            is_reserved();
            return curr_token;
        }
        else if (isdigit(c))
        {
            number();
            return curr_token;
        }
        else if (is_special(c))
        {
            special();
            return curr_token;
        }
        else if (in->eof())
        {
            return Token::T_EOF;
        }
        else
        {
            illegal(c);
            in->get();
        }
    }
    return Token::T_EOF;
}

// Ignore till newline
void Scanner::comment_state()
{
    while (in->peek() != '\n')
    {
        in->get();
    }
    std::cout << "Comment caught at line " << line_number << "\n";
}

// Prints out a warning for a bad character to stderr
void Scanner::illegal(char c)
{
    std::cerr << "Illegal character " << c << " at line "
              << line_number << '\n';
}

// Check if a char is special/operator
bool Scanner::is_special(char c)
{
    switch (c)
    {
    case '+':
    case '-':
    case '*':
    case '/':
    case '%':
    case '<':
    case '>':
    case '|':
    case '(':
    case ')':
    case '{':
    case '}':
    case ';':
    case ',':
        return true;
    default:
        return false;
    }
}

// Changes the current token to the corresponding operator, handles comments
// as well as strings
void Scanner::special()
{
    char c = in->get();
    switch (c)
    {
    case '+':
        curr_token = Token::T_ADD;
        break;
    case '-':
        curr_token = Token::T_MINUS;
        break;
    case '*':
        curr_token = Token::T_MULTIPLY;
        break;
    case '/':
        curr_token = Token::T_DIVIDE;
        if (in->peek() == '/')
        {
            curr_token = Token::T_COMMENT;
            in->get();
            comment_state();
        }
        break;
    case '%':
        curr_token = Token::T_MODULUS;
        break;
    case '<':
        curr_token = Token::T_LESSTHAN;
        if (in->peek() == '=')
        {
            curr_token = Token::T_LESSTHANEQUAL;
            in->get();
        }
        break;
    case '>':
        curr_token = Token::T_GREATERTHAN;
        if (in->peek() == '=')
        {
            curr_token = Token::T_GREATERTHANEQUAL;
            in->get();
        }
        break;
    case '(':
        curr_token = Token::T_LEFTPARANTHESE;
        break;
    case ')':
        curr_token = Token::T_RIGHTPARANTHESE;
        break;
    case '{':
        curr_token = Token::T_LEFTBRACE;
        break;
    case '}':
        curr_token = Token::T_RIGHTBRACE;
        break;
    case ';':
        curr_token = Token::T_SEMICOLON;
        break;
    case ',':
        curr_token = Token::T_COMMA;
        break;
    default:
        break;
    }
}

//Creates an identifier if the stream of characters started with an alpha or _
//and is followed by any number of alphanumerics or _
void Scanner::identifier()
{
    curr_token = Token::T_ID;
    lexeme.push_back(in->get());
    char c = in->peek();
    while (isalnum(c) || c == '_')
    {
        lexeme.push_back(in->get());
        c = in->peek();
    }
}

// Reads and appends to lexeme until a char other than a
// digit is encountered
void Scanner::number()
{
    curr_token = Token::T_NUMBER;
    lexeme.push_back(in->get());
    char c = in->peek();
    while (isdigit(c))
    {
        lexeme.push_back(in->get());
        c = in->peek();
    }
}

// Checks if the current token lexeme is a reserved word
void Scanner::is_reserved()
{
    if (lexeme == "true")
    {
        curr_token = Token::T_TRUE;
        lexeme.clear();
    }
    else if (lexeme == "false")
    {
        curr_token = Token::T_FALSE;
        lexeme.clear();
    }
    else if (lexeme == "boolean")
    {
        curr_token = Token::T_BOOLEAN;
        lexeme.clear();
    }
    else if (lexeme == "int")
    {
        curr_token = Token::T_INT;
        lexeme.clear();
    }
    else if (lexeme == "void")
    {
        curr_token = Token::T_VOID;
        lexeme.clear();
    }
    else if (lexeme == "if")
    {
        curr_token = Token::T_IF;
        lexeme.clear();
    }
    else if (lexeme == "else")
    {
        curr_token = Token::T_ELSE;
        lexeme.clear();
    }
    else if (lexeme == "while")
    {
        curr_token = Token::T_WHILE;
        lexeme.clear();
    }
    else if (lexeme == "break")
    {
        curr_token = Token::T_BREAK;
        lexeme.clear();
    }
    else if (lexeme == "return")
    {
        curr_token = Token::T_RETURN;
        lexeme.clear();
    }
}