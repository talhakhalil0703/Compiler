#ifndef TOKEN_HPP
#define TOKEN_HPP

//Code adapted from what Shankar Ganesh (TA) provided in tutorials

enum class Token
{
    T_EOF,
    T_ID,
    T_TRUE,
    T_FALSE,
    T_BOOLEAN,
    T_INT,
    T_VOID,
    T_IF,
    T_ELSE,
    T_WHILE,
    T_BREAK,
    T_RETURN,
    T_STRING,
    T_NUMBER,
    T_ADD,
    T_MINUS,
    T_MULTIPLY,
    T_DIVIDE,
    T_MODULUS,
    T_LESSTHAN,
    T_GREATERTHAN,
    T_LESSTHANEQUAL,
    T_GREATERTHANEQUAL,
    T_ASSIGN,
    T_EQUAL,
    T_NOTEQUAL,
    T_NOT,
    T_AND,
    T_OR,
    T_LEFTPARANTHESE,
    T_RIGHTPARANTHESE,
    T_LEFTBRACE,
    T_RIGHTBRACE,
    T_SEMICOLON,
    T_COMMA
};

// Returns the token in string format
// Used for printing
inline char const *getName(Token tok)
{
    switch (tok)
    {
    case Token::T_EOF:
        return "EOF";
    case Token::T_ID:
        return "ID";
    case Token::T_TRUE:
        return "TRUE";
    case Token::T_FALSE:
        return "FALSE";
    case Token::T_BOOLEAN:
        return "BOOLEAN";
    case Token::T_INT:
        return "INT";
    case Token::T_VOID:
        return "VOID";
    case Token::T_IF:
        return "IF";
    case Token::T_ELSE:
        return "ELSE";
    case Token::T_WHILE:
        return "WHILE";
    case Token::T_BREAK:
        return "BREAK";
    case Token::T_RETURN:
        return "RETURN";
    case Token::T_STRING:
        return "STRING";
    case Token::T_NUMBER:
        return "NUMBER";
    case Token::T_ADD:
        return "+";
    case Token::T_MINUS:
        return "-";
    case Token::T_MULTIPLY:
        return "*";
    case Token::T_DIVIDE:
        return "/";
    case Token::T_MODULUS:
        return "%";
    case Token::T_LESSTHAN:
        return "<";
    case Token::T_GREATERTHAN:
        return ">";
    case Token::T_LESSTHANEQUAL:
        return "<=";
    case Token::T_GREATERTHANEQUAL:
        return ">=";
    case Token::T_ASSIGN:
        return "=";
    case Token::T_EQUAL:
        return "==";
    case Token::T_NOTEQUAL:
        return "!=";
    case Token::T_NOT:
        return "!";
    case Token::T_AND:
        return "&&";
    case Token::T_OR:
        return "||";
    case Token::T_LEFTPARANTHESE:
        return "(";
    case Token::T_RIGHTPARANTHESE:
        return ")";
    case Token::T_LEFTBRACE:
        return "{";
    case Token::T_RIGHTBRACE:
        return "}";
    case Token::T_SEMICOLON:
        return ";";
    case Token::T_COMMA:
        return ",";
    default:
        return "";
    }
}

#endif