#ifndef SYNTHESIS
#define SYNTHESIS
#include <string>
#include "tree.hpp"
#include "symboltable.hpp"
#include "semantic.hpp"

class Synthesis{
public:
    Synthesis(Semantic & semantic, Tree & program);
    ~Synthesis() = default;

    
    Semantic & semantic;
    Tree &program_tree;
    std::string assembly;
    std::string data;
    std::string text;
    int label_count = 0;
    int register_count = 8;
    std::string while_loop_leave_label;
    std::string return_label;

private:
    void synthesize(Tree & node);
    void run_time_libraries();
    void print_assembly();
    bool part_of_runtime(std::string & str);
    std::string convert_string_to_bytes(std::string &str);
    std::string insert_into_data(std::string str);
    std::string get_label();
    void mips_instruction(std::string instr, std::string c2, std::string c3 = "", std::string c4 ="");
    void add_label(std::string label);
    void evaluate_expressions(Tree &node);
    void tri_operator(Tree &node);
    void comparison_operator(Tree &node);
    void function_call (Tree &node);
    void dump_registers(uint count);
    void recover_registers(uint count);
    void global_pass(Tree & node);
    void add_return_label();
    std::string get_register();
};
#endif