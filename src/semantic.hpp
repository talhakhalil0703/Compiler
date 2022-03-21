#ifndef SEMANTIC
#define SEMANTIC

#include <vector>
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

    // Helper funcitons
    void error(std::string message, Tree &node);
    void error(std::string message);
    std::string get_name(Tree &node);
    Tree *get_id(Tree &node);
    std::string get_type(Tree &node, bool is_function = false);
    SymbolEntry *get_entry(std::string name);
};
#endif