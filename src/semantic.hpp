#ifndef SEMANTIC
#define SEMANTIC

#include <vector>
#include <string>
#include "tree.hpp"
#include "symboltable.hpp"
#include "errorhandler.hpp"

class Semantic
{
public:
    Semantic(Tree &program);
    ~Semantic() = default;

    Tree &program;
    SymbolTable table;

protected:
private:
    std::vector<SymbolTable *> memory_stack;

    ErrorHandler error_handler = ErrorHandler();
    void analyze();
    void global_declarations();
    void id_identification(Tree &node, SymbolTable &table);
    void type_checking(Tree &node);
    void function_checking(Tree &node);
    void function_declaration_checks(Tree &node);
    void function_call_checks(Tree &node);
    void aggregate_returns(Tree &node, std::vector<std::string> &returns, std::string expected);
    void extract_function_argument_type(std::string type_string, std::vector<std::string>& args);

    // Helper funcitons
    void error(std::string message, Tree &node);
    void error(std::string message);
    std::string get_name(Tree &node);
    Tree *get_id(Tree &node);
    std::string get_type(Tree &node, bool is_function = false);
    std::string get_return_type();
    SymbolEntry *get_entry(std::string name);
    bool is_operator(Tree &node);

    int scope_depth = 0;

    // && ||
    void and_or_operator(Tree &node, std::vector<std::string> args);
    // == !=
    void equality_operator(Tree &node, std::vector<std::string> args);
    // < > <= >=
    void comparison_operator(Tree &node, std::vector<std::string> args);
    // + * / %
    void arithmetic_operator(Tree &node, std::vector<std::string> args);
    // -
    void min_operator(Tree &node, std::vector<std::string> args);
    // !
    void not_operator(Tree &node, std::vector<std::string> args);
    // =
    void assignment_operator(Tree &node, std::vector<std::string> args);
};
#endif