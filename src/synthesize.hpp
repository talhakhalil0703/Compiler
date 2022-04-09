#ifndef SYNTHESIS
#define SYNTHESIS
#include <string>
#include "tree.hpp"
#include "symboltable.hpp"

class Synthesis{
public:
    Synthesis(Tree &program, SymbolTable &table);
    ~Synthesis() = default;

    Tree &program_tree;
    SymbolTable &table;
    std::string assembly;
    std::string data;
    std::string text;
    int label_count = 0;

private:
    void synthesize(Tree & node);
    void run_time_libraries();
    void print_assembly();
    std::string convert_string_to_bytes(std::string &str);
    std::string insert_into_data(std::string str);
};
#endif