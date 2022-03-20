#ifndef SEMANTIC
#define SEMANTIC
#include <unordered_map>
#include "tree.hpp"

enum class Kind
{
    var,
    func,
    arg,
    global_var
};

class SymbolEntry
{
public:
    SymbolEntry();
    ~SymbolEntry() = default;

    std::string name;
    Kind kind;
    std::string type;
};

class SymbolTable
{
public:
    SymbolTable();
    ~SymbolTable() = default;

    std::unordered_map<std::string, SymbolEntry> enteries;
    std::vector<std::unordered_map<std::string, SymbolEntry>> inner_scope = {};
};

class Semantic
{
public:
    Semantic(Tree &program);
    ~Semantic() = default;

    Tree &program;

protected:
private:
    SymbolTable table;

    void analyze();
    void global_declarations();

    // Helper funcitons
    std::string get_name(Tree &node);
    std::string get_type(Tree &node, bool is_function = false);
};
#endif