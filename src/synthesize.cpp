#include "synthesize.hpp"

Synthesis::Synthesis(Tree &tree, SymbolTable &symbol_table) : program_tree(tree), table(symbol_table)
{
    run_time_libraries();
    synthesize(program_tree);
    print_assembly();
}

void Synthesis::print_assembly()
{
    std::cout << "Assembly Output:" << std::endl;
    std::cout << data << std::endl;
    std::cout << text << std::endl;
}

void Synthesis::run_time_libraries()
{
    std::string return_string = "jr $ra\n";
    std::string true_string = ".byte 84, 82, 85, 69\n";
    std::string false_string = ".byte 70, 65, 76, 83, 69\n";
    std::string align = ".align 2\n";
    std::string dot_data = ".data\n";
    std::string dot_text = ".text\n";
    std::string halt = "Lhalt:\n";
    std::string get_char = "Lgetchar:\n";
    std::string beq = "beq $a0, $zero, Lfalse\n";
    std::string syscall = "syscall\n";
    std::string lfalse = "Lfalse:\n";
    std::string error = "error:\n";
    std::string v0_string = "li $v0, ";
    std::string lprint = "Lprint";
    std::string j = "j ";
    std::string jal = "jal ";
    std::string la_a0 = "la $a0, ";

    data = dot_data + "true_boolean:\n" + true_string + align + "false_boolean:\n" + false_string + align;

    text = dot_text + lprint + "i:\n" + v0_string + "1\n" + syscall + return_string + get_char + v0_string + "12\n" + syscall + return_string + lprint + "c:\n" + v0_string + "11\n" + syscall + return_string + lprint + "s:\n" + v0_string + "4\n" + syscall + return_string + lprint + "b:\n" + beq + la_a0 + "true_boolean\n" + j + "Lprintb2\n" + lfalse + la_a0 + "false_boolean\n" + lprint + "b2:\n" + v0_string + "4\n" + syscall + return_string + halt + v0_string + "10\n" + syscall + error + "jal Lprints\n" + j + "LHalt\n";

    table.get_entry("getchar")->assembly_label = "Lgetchar";
    table.get_entry("halt")->assembly_label = "Lhalt";
    table.get_entry("prints")->assembly_label = "Lprints";
    table.get_entry("printb")->assembly_label = "Lprintb";
    table.get_entry("printc")->assembly_label = "Lprintc";
    table.get_entry("printi")->assembly_label = "Lprintci";
}

void Synthesis::synthesize(Tree &node)
{
    // do things
    if (node.type == "main_declaration")
    {
        text += ".globl main\n";
        text += "main:\n";
    }
    else if (node.type == "function_call")
    {
        std::string function_to_call = node.branches[0].attr;
        std::string label_of_function_to_call = table.get_entry(function_to_call)->assembly_label;
        // Save all variables on stack
        auto actuals = node.branches[1];
        for (int i = 0; i < actuals.branches.size(); i++)
        {
            auto actual = actuals.branches[i];
            if (actual.type == "string")
            {
                std::string label = insert_into_data(actual.attr);
                text += "la $a" + std::to_string(i) + ", " + label + "\n";
            } // Deal with other kinds of acutals
        }
        text += "jal "+ label_of_function_to_call + "\n";
        // Get all variables from stack
    }

    for (int i = 0; i < node.branches.size(); i++)
    {
        synthesize(node.branches[i]);
    }
    if (node.type == "main_declaration")
    {
        text += "j Lhalt\n";
    }
}

std::string Synthesis::insert_into_data(std::string str)
{
    std::string label_string = "L" + std::to_string(label_count++);
    data += label_string + ":\n";
    data += convert_string_to_bytes(str);
    return label_string;
}

std::string Synthesis::convert_string_to_bytes(std::string &str)
{
    std::string return_string = ".byte ";
    for (int i = 0; i < str.size(); i++)
    {
        int x = int(str[i]);
        if (x == 92){ // If x is a \
            i++;
            i++;
            x = int(str[i]);
            switch (x)
            {
            case 98: //b
                x = 8;
                break;
            case 102: // f
                x =12;
                break;
            case 116: // t
                x = 9;
                break;
            case 114: //r
                x = 31;
                break;
            case 110: //n
                x =10;
                break;
            case 92: // \
                x = 92;
                break;
            default:
                break;
            }
        }
        return_string += std::to_string(x);
        if (i != str.size() - 1)
            return_string += ", ";
    }
    return_string += "\n.align 2\n";
    return return_string;
}