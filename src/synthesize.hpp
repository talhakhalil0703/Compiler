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
    int register_count = 0;
    std::string while_loop_leave_label;

private:
    void synthesize(Tree & node);
    void run_time_libraries();
    void print_assembly();
    std::string convert_string_to_bytes(std::string &str);
    std::string insert_into_data(std::string str);
    std::string get_label();
    void mips_instruction(std::string instr, std::string c2, std::string c3 = "", std::string c4 ="");
    void add_label(std::string label);
    void evaluate_expressions(Tree &node);
    void tri_operator(Tree &node);
    void comparison_operator(Tree &node);
    std::string get_register();
};
#endif