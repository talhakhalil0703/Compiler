#ifndef SYMBOLTABLE
#define SYMBOLTABLE
#include <unordered_map>
#include <vector>
#include <string>
#include <iostream>
#include <sstream>

enum class Kind
{
    var,
    func,
    arg,
    global_var
};

// Returns the token in string format
// Used for printing
inline char const *getName(Kind kind)
{
    switch (kind)
    {
    case Kind::var:
        return "var";
    case Kind::func:
        return "func";
    case Kind::arg:
        return "arg";
    case Kind::global_var:
        return "global_var";
    default:
        return "";
    }
}
class SymbolTable;

class SymbolEntry
{
public:
    SymbolEntry();
    ~SymbolEntry() = default;

    std::string name;
    Kind kind;
    std::string type;
    std::string return_type;
    std::string assembly_label;
    SymbolTable *inner_scope = nullptr;

    std::string print(int tab_amount = 0);
};

class SymbolTable
{
public:
    SymbolTable();
    ~SymbolTable() = default;

    std::unordered_map<std::string, SymbolEntry> enteries;

    std::string print(int tab_amount = 0);

    SymbolEntry *get_entry(std::string name);
    bool insert_entry(std::string name, SymbolEntry entry);
};

#endif