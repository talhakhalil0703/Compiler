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
    data += "div_by_zero:\n";
    data += ".byte  100 , 105 , 118 , 105 , 115 , 105 , 111 , 110 , 32 , 98 , 121 , 32 , 122 , 101 , 114 , 111 , 0\n";
    data += align;

    text = dot_text + lprint + "i:\n";
    text += v0_string + "1\n";
    text += syscall + return_string + get_char + v0_string + "12\n";
    text += syscall + return_string + lprint + "c:\n";
    text += v0_string + "11\n";
    text += syscall + return_string + lprint + "s:\n";
    text += v0_string + "4\n";
    text += syscall + return_string + lprint + "b:\n";
    text += beq + la_a0 + "true_boolean\n";
    text += j + "Lprintb2\n";
    text += lfalse + la_a0 + "false_boolean\n";
    text += lprint + "b2:\n";
    text += v0_string + "4\n";
    text += syscall + return_string + halt + v0_string + "10\n";
    text += syscall + error + "jal Lprints\n";
    text += j + "LHalt\n\n";

    table.get_entry("getchar")->assembly_label = "Lgetchar";
    table.get_entry("halt")->assembly_label = "Lhalt";
    table.get_entry("prints")->assembly_label = "Lprints";
    table.get_entry("printb")->assembly_label = "Lprintb";
    table.get_entry("printc")->assembly_label = "Lprintc";
    table.get_entry("printi")->assembly_label = "Lprintci";
}

void Synthesis::synthesize(Tree &node)
{
    if (node.type == "main_declaration")
    {
        text += ".globl main\n";
        add_label("main");
        synthesize(node.branches[3]); //block node
    }
    else if (node.type == "function_call")
    {
        // FIXME: Add saving registers and stuff this isn't done
        std::string function_to_call = node.branches[0].attr;
        std::string label_of_function_to_call = table.get_entry(function_to_call)->assembly_label;
        // Save all variables on stack
        auto actuals = node.branches[1];
        for (uint i = 0; i < actuals.branches.size(); i++)
        {
            auto actual = actuals.branches[i];
            if (actual.type == "string")
            {
                std::string label = insert_into_data(actual.attr);
                mips_instruction("la", "$a" + std::to_string(i), label);
            } // Deal with other kinds of acutals
        }
        mips_instruction("jal", label_of_function_to_call);
        // Get all variables from stack
    }
    else if (node.type == "if_else")
    {
        std::string else_label = get_label();
        std::string done_label = get_label();
        // Evalulate expression
        evaluate_expressions(node.branches[0]);
        //Test expression
        mips_instruction("beqz", node.branches[0].id_register, else_label);
        // if statement
        synthesize(node.branches[1]);
        mips_instruction("j", done_label);
        add_label(else_label);
        synthesize(node.branches[2]);
        add_label(done_label);
    } else if (node.type == "if"){
        std::string label = get_label();
        evaluate_expressions(node.branches[0]);
        mips_instruction("beqz", node.branches[0].id_register, label);
        //Statement synthesis? like the if statment block synthesis
        synthesize(node.branches[1]);
        add_label(label);
    } else if (node.type == "block" || node.type == "program"|| node.type =="statement"){
        for (uint i = 0; i < node.branches.size(); i++)
        {
            synthesize(node.branches[i]);
        }
    }



    if (node.type == "main_declaration")
    {
        mips_instruction("j", "Lhalt");
    }
}

void preOrderTraversal(Tree &node, void *func(Tree &node))
{
    func(node);

    for (uint i = 0; i < node.branches.size(); i++)
    {
        func(node.branches[i]);
    }
}

void postOrderTraversal(Tree &node, void *func(Tree &node))
{
    for (uint i = 0; i < node.branches.size(); i++)
    {
        func(node.branches[i]);
    }

    func(node);
}

std::string Synthesis::get_register()
{
    // TODO: Might want to make this more complex later on
    return "$" + std::to_string(8 + register_count++);
}

void Synthesis::evaluate_expressions(Tree &node)
{
    // std::string return_string = "";
    std::string node_type = node.type;
    if (node_type == "number")
    {
        std::string reg = get_register();
        mips_instruction("li", reg, node.attr);
        node.id_register = reg;
    } else if(node_type == "false"){
        std::string reg = get_register();
        mips_instruction("li", reg, "0");
        node.id_register = reg;
    } else if(node_type == "true"){
        std::string reg = get_register();
        mips_instruction("li", reg, "1");
        node.id_register = reg;
    }

    for (uint i = 0; i < node.branches.size(); i++)
    {
        evaluate_expressions(node.branches[i]);
    }

    if (node.type == "=")
    {
        std::string id_reg = node.branches[0].id_register;
        std::string to_assign_reg = node.branches[1].id_register;
        // FIXME: Does not seem sound here
        mips_instruction("move", id_reg, to_assign_reg);
    }
    else if (node.type == "-")
    {
        std::string id_reg = node.branches[0].id_register;
        std::string neg_reg = get_register();
        mips_instruction("negu", neg_reg, id_reg);
        node.id_register = neg_reg;
    }
    else if (node.type == "!")
    {
        std::string id_reg = node.branches[0].id_register;
        std::string not_reg = get_register();
        mips_instruction("xori", not_reg, id_reg, "1");
        node.id_register = not_reg;
    }
    else if (node.type == "+" || node.type == "*" || node.type == "/" || node.type == "%" || node.type == "<" || node.type == ">" || node.type == ">=" || node.type == "<=" || node.type == "==" || node.type == "!=" || node.type == "AND" || node.type == "OR")
    {
        tri_operator(node);
    }
}

void Synthesis::tri_operator(Tree &node)
{
    std::string arg1 = node.branches[0].id_register;
    std::string arg2 = node.branches[1].id_register;

    std::string dest = get_register();
    if (node.type == "*")
    {
        // TODO: Check for overflow?
        mips_instruction("mul", dest, arg1, arg2);
    }
    else if (node.type == "/" || node.type == "%")
    {
        std::string not_div_by_zero = get_label();
        mips_instruction("bnez", arg2, not_div_by_zero);
        mips_instruction("la", "$a0", "div_by_zero");
        mips_instruction("j", "error");
        add_label(not_div_by_zero);
        if (node.type == "/")
        {
            // TODO: Check for overflow?
            mips_instruction("div", dest, arg1, arg2);
        }
        else
        {
            mips_instruction("rem", dest, arg1, arg2);
        }
    }
    else if (node.type == "+")
    {
        mips_instruction("addu", dest, arg1, arg2);
    }
    else if (node.type == "<")
    {
        mips_instruction("slt", dest, arg1, arg2);
    }
    else if (node.type == ">")
    {
        mips_instruction("sgt", dest, arg1, arg2);
    }
    else if (node.type == "<=")
    {
        mips_instruction("sle", dest, arg1, arg2);
    }
    else if (node.type == ">=")
    {
        mips_instruction("sge", dest, arg1, arg2);
    }
    else if (node.type == "==")
    {
        mips_instruction("seq", dest, arg1, arg2);
    }
    else if (node.type == "!=")
    {
        mips_instruction("sne", dest, arg1, arg2);
    }
    else if (node.type == "AND")
    {
        std::string label = get_label();
        mips_instruction("move", dest, arg1);
        mips_instruction("beqz", dest, label);
        mips_instruction("move", dest, arg2);
        add_label(label);
    }
    else if (node.type == "OR")
    {
        std::string label = get_label();
        mips_instruction("move", dest, arg1);
        mips_instruction("bnez", dest, label);
        mips_instruction("move", dest, arg2);
        add_label(label);
    }
    node.id_register = dest;
}

std::string Synthesis::insert_into_data(std::string str)
{
    std::string label_string = get_label();
    data += label_string + ":\n";
    data += convert_string_to_bytes(str);
    return label_string;
}

std::string Synthesis::get_label()
{
    return "L" + std::to_string(label_count++);
}

std::string Synthesis::convert_string_to_bytes(std::string &str)
{
    // TODO: Null char check needed? Maybe
    std::string return_string = ".byte ";
    for (uint i = 0; i < str.size(); i++)
    {
        int x = int(str[i]);
        if (x == 92)
        { // If x is a slash
            i++;
            i++;
            x = int(str[i]);
            switch (x)
            {
            case 98: // b
                x = 8;
                break;
            case 102: // f
                x = 12;
                break;
            case 116: // t
                x = 9;
                break;
            case 114: // r
                x = 31;
                break;
            case 110: // n
                x = 10;
                break;
            case 92: // slash
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

void Synthesis::mips_instruction(std::string instr, std::string c2, std::string c3, std::string c4)
{
    text += instr + " " + c2;
    if (c3 != "")
    {
        text += ", " + c3;
        if (c4 != "")
        {
            text += ", " + c4;
        }
    }
    text += "\n";
}

void Synthesis::add_label(std::string label)
{
    text += label + ":\n";
}