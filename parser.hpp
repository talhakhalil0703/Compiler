#ifndef PARSER
#define PARSER

#include "tree.hpp"
#include "scanner.hpp"

class Parser
{
public:
    Parser(std::istream *input);
    ~Parser() = default;

    std::unique_ptr<Scanner> scanner;

    Tree parse();
    Token nextToken;
    std::string lexeme;
    // int GetLine() { return line_number; };
    // std::string GetLexeme();
    // Token Scan();

protected:
    // int line_number;
    // Token curr_token;
    ErrorHandler error_handler = ErrorHandler();
    // std::string lexeme;

private:
    // std::istream *in;
    void error(std::string m);
    void consumeToken();
    bool token_in_statement_function(Token tok);
    Tree start();

    void literal(Tree &tree);

    void type(Tree &tree);

    void global_declarations(Tree &program);
    void global_declarations_(Tree &tree);
    Tree global_declaration();

    Tree variable_declaration();

    void identifier(Tree &tree);

    Tree function_decleration();
    Tree function_header();
    Tree function_declarator(Tree &tree);

    void formal_parameter_list(Tree &tree);
    void formal_parameter_list_(Tree &tree);
    void formal_parameter(Tree &tree);

    Tree main_function_declaration();
    void main_function_declarator(Tree &tree);

    void block(Tree &tree);
    void block_statements(Tree &tree);
    void block_statements_(Tree &tree);
    void block_statement(Tree &tree);

    void statement(Tree &tree);
    void statement_expression(Tree &tree);

    void primary(Tree &tree);

    Tree argument_list();
    void argument_list_(Tree &tree);

    void function_invocation(Tree &tree);

    void post_fix_expression(Tree &tree);

    void unary_expression(Tree &tree);

    void multiplicative_expression(Tree &tree);
    void multiplicative_expression_(Tree &tree);

    void additive_expression(Tree &tree);
    void additive_expression_(Tree &tree);

    void relational_expression(Tree &tree);
    void relational_expression_(Tree &tree);

    void equality_expression(Tree &tree);
    void equality_expression_(Tree &tree);

    void conditional_and_expression(Tree &tree);
    void conditional_and_expression_(Tree &tree);

    void conditional_or_expression(Tree &tree);
    void conditional_or_expression_(Tree &tree);

    void assignment_expression(Tree &tree);
    void assignment(Tree &tree);
    void expression(Tree &tree);
};

#endif