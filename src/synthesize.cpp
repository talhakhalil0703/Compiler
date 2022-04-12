#include "synthesize.hpp"

// #define _DEBUG
#ifdef _DEBUG
#define FREE_PRINT(x) text += "# FREEING " + get_register_name(x) +"\n";
#define TAKING_PRINT(x)  text += "# TAKING " + get_register_name(x) +"\n";
#define NODE_LINE_NUMBER(x)  text += "# NODE LINE NUMBER " + std::to_string(x.line_number) +"\n";

#else
#define FREE_PRINT(x)
#define TAKING_PRINT(x) 
#define NODE_LINE_NUMBER(x)
#endif

Synthesis::Synthesis(Semantic& sem, Tree& prog) : semantic(sem), program_tree(prog)
{
    run_time_libraries();
    global_pass(program_tree);
    synthesize(program_tree);
    add_return_label();
    print_assembly();
}

void Synthesis::print_assembly()
{
    std::cout << data << std::endl;
    std::cout << text << std::endl;
}

void Synthesis::run_time_libraries()
{
    std::string return_string = "\tjr $ra\n";
    std::string true_string = "\t.byte 84 82 85 69 0\n";
    std::string false_string = "\t.byte 70 65 76 83 69 0\n";
    std::string align = "\t.align 2\n";
    std::string dot_data = ".data\n";
    std::string dot_text = ".text\n";
    std::string halt = "Lhalt:\n";
    std::string get_char = "Lgetchar:\n";
    std::string beq = "\tbeqz $a0, Lfalse\n";
    std::string syscall = "\tsyscall\n";
    std::string lfalse = "Lfalse:\n";
    std::string error = "error:\n";
    std::string v0_string = "\tli $v0, ";
    std::string lprint = "Lprint";
    std::string j = "\tj ";
    std::string jal = "\tjal ";
    std::string la_a0 = "\tla $a0, ";

    data = dot_data + "true_boolean:\n" + true_string + align + "false_boolean:\n" + false_string + align;
    data += "div_by_zero:\n";
    data += "\t.byte  100 105 118 105 115 105 111 110 32 98 121 32 122 101 114 111 0\n";
    data += align;
    data += "char:\n";
    data += "\t.space 2\n";

    text = dot_text + lprint + "i:\n";
    text += v0_string + "1\n";
    text += syscall + return_string;
    // text +=  get_char + v0_string + "12\n";
    // text += syscall + return_string;
    text += get_char;
    text += "\tli $v0, 8\n\tla $a0, char\n\tli $a1, 2\n";
    text += syscall;
    text += "\tlbu $a0, char\n\tbeqz $a0, Leof\n\tmove $v0, $a0\n\tjr $ra\n";
    text += "Leof:\n\tli $v0, -1\n\tjr $ra\n";
    text += lprint + "c:\n";
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
    text += syscall + error + "\tjal Lprints\n";
    text += j + "Lhalt\n\n";

    semantic.get_entry("getchar")->assembly_label = "Lgetchar";
    semantic.get_entry("halt")->assembly_label = "Lhalt";
    semantic.get_entry("prints")->assembly_label = "Lprints";
    semantic.get_entry("printb")->assembly_label = "Lprintb";
    semantic.get_entry("printc")->assembly_label = "Lprintc";
    semantic.get_entry("printi")->assembly_label = "Lprinti";
}

bool Synthesis::part_of_runtime(std::string& str) {
    if (str == "getchar" || str == "halt" || str == "printb" || str == "printc" || str == "printi" || str == "prints") {
        return true;
    }
    return false;
}
void Synthesis::add_return_label() {
    add_label("return_label");
    mips_instruction("lw", "$ra", "0($sp)");
    mips_instruction("addu", "$sp", "$sp", "4");
    mips_instruction("jr", "$ra");
}

void Synthesis::global_pass(Tree& program) {
    for (uint i = 0; i < program.branches.size(); i++) {
        Tree& node = program.branches[i];
        if (node.type == "function_declaration") {
            std::string id = node.branches[1].attr;
            std::string label = "FUNCTION_" + id;
            node.branches[1].sym->assembly_label = label;
        }
        else if (node.type == "global_variable_declaration") {
            std::string id = node.branches[1].attr;
            std::string label = "GLOBAL_VAR_" + id;
            data += label + ": \n.word 0\n";
            node.branches[1].sym->assembly_label = label;
        }
    }
}

void Synthesis::synthesize(Tree& node)
{
    if (node.type == "main_declaration")
    {
        text += ".globl main\n";
        add_label("main");
        register_pool = RegisterPool();
        synthesize(node.branches[3]); //block node
        mips_instruction("j", "Lhalt");
    }
    else if (node.type == "function_declaration") {
        std::string label = node.branches[1].sym->assembly_label;
        text += ".globl " + label + "\n";
        add_label(label);
        mips_instruction("subu", "$sp", "$sp", "4");
        mips_instruction("sw", "$ra", "0($sp)");
        register_pool = RegisterPool();
        synthesize(node.branches[2]);
        synthesize(node.branches[3]);
        for (uint i = 0; i < node.branches[2].branches.size(); i++) {
            Tree formal = node.branches[2].branches[i];
            SingleRegister reg = formal.branches[1].sym->register_id;
            FREE_PRINT(reg)
                register_pool.free_register(reg);
        }

        if (node.branches[0].type == "void") {
            mips_instruction("j", "return_label");
        }
        else {
            std::string error_string = "function \"" + node.branches[1].attr + "\" must return a value";
            std::string error_label = insert_into_data(error_string);
            mips_instruction("la", "$a0", error_label);
            mips_instruction("j", "error");
        }

    }
    else if (node.type == "if_else")
    {
        std::string else_label = "else_" + get_label();
        std::string done_label = "end_if" + get_label();
        // Evalulate expression
        evaluate_expressions(node.branches[0]);
        //Test expression
        mips_instruction("beqz", get_register_name(node.branches[0].id_register), else_label);
        free_node_register(node.branches[0]);
        // if statement
        synthesize(node.branches[1]);
        mips_instruction("j", done_label);
        add_label(else_label);
        synthesize(node.branches[2]);
        add_label(done_label);
    }
    else if (node.type == "if") {
        std::string label = "end_if_" + get_label();
        evaluate_expressions(node.branches[0]);
        mips_instruction("beqz", get_register_name(node.branches[0].id_register), label);
        free_node_register(node.branches[0]);
        //Statement synthesis? like the if statment block synthesis
        synthesize(node.branches[1]);
        add_label(label);
    }
    else if (node.type == "OR") {
        std::string done_label = "or_done" + get_label();
        std::string true_label = "or_true" + get_label();
        Tree arg1 = node.branches[0];
        Tree arg2 = node.branches[1];
        evaluate_expressions(arg1);
        mips_instruction("bnez", get_register_name(arg1.id_register), true_label);
        free_node_register(arg1);
        evaluate_expressions(arg2);
        mips_instruction("bnez", get_register_name(arg2.id_register), true_label);
        free_node_register(arg2);
        SingleRegister dest = get_register();
        // otherwise is false
        mips_instruction("li", get_register_name(dest), "0");
        mips_instruction("j", done_label);
        add_label(true_label);
        mips_instruction("li", get_register_name(dest), "1");
        add_label(done_label);
        node.id_register = dest;
    }
    else if (node.type == "AND") {
        std::string done_label = "and_done" + get_label();
        std::string false_label = "and_false" + get_label();
        Tree arg1 = node.branches[0];
        Tree arg2 = node.branches[1];
        evaluate_expressions(arg1);
        mips_instruction("beqz", get_register_name(arg1.id_register), false_label);
        free_node_register(arg1);
        evaluate_expressions(arg2);
        mips_instruction("beqz", get_register_name(arg2.id_register), false_label);
        free_node_register(arg2);
        SingleRegister dest = get_register();
        // otherwise is true
        mips_instruction("li", get_register_name(dest), "1");
        mips_instruction("j", done_label);
        add_label(false_label);
        mips_instruction("li", get_register_name(dest), "0");
        add_label(done_label);
        node.id_register = dest;
    }
    else if (node.type == "while") {
        std::string start_label = "while_" + get_label();
        std::string exit_label = "while_exit_" + get_label();
        while_labels.push(exit_label);
        add_label(start_label);
        evaluate_expressions(node.branches[0]);
        mips_instruction("beqz", get_register_name(node.branches[0].id_register), exit_label);
        free_node_register(node.branches[0]);
        if (node.branches.size() == 2) {
            synthesize(node.branches[1]);
        }
        mips_instruction("j", start_label);
        add_label(exit_label);
        while_labels.pop();
    }
    else if (node.type == "return") {
        NODE_LINE_NUMBER(node)
            if (node.branches.size() == 1) {
                evaluate_expressions(node.branches[0], node.type);
                mips_instruction("move", "$v0", get_register_name(node.branches[0].id_register));
                free_node_register(node.branches[0]);
            }
        mips_instruction("j", "return_label");
    }
    else if (node.type == "break") {
        mips_instruction("j", while_labels.top());
    }
    else if (node.type == "variable_declaration") {
        SingleRegister reg = get_register();
        node.branches[1].sym->register_id = reg;
    }
    else if (node.type == "statement") {
        evaluate_expressions(node.branches[0]);
    }
    else if (node.type == "block" || node.type == "program") {
        for (uint i = 0; i < node.branches.size(); i++)
        {
            synthesize(node.branches[i]);
        }
    }
    else if (node.type == "formals") {
        for (uint i = 0; i < node.branches.size(); i++) {
            Tree& formal = node.branches[i];
            SingleRegister reg = get_register();
            mips_instruction("move", get_register_name(reg), "$a" + std::to_string(i));
            formal.branches[1].sym->register_id = reg;
        }
    }

}

SingleRegister Synthesis::get_register()
{
    SingleRegister reg = register_pool.get_register(text);
    TAKING_PRINT(reg)
        return reg;
}

void Synthesis::free_node_register(Tree& node) {
    if (node.type == "id" && node.sym->kind != Kind::global_var) {
        return;
    }
    FREE_PRINT(node.id_register)
        register_pool.free_register(node.id_register);
}

void Synthesis::evaluate_expressions(Tree& node, std::string parent_type)
{
    // std::string return_string = "";
    std::string node_type = node.type;
    if (node_type == "number")
    {
        SingleRegister reg = get_register();
        mips_instruction("li", get_register_name(reg), node.attr);
        node.id_register = reg;
    }
    else if (node_type == "false") {
        SingleRegister reg = get_register();
        mips_instruction("li", get_register_name(reg), "0");
        node.id_register = reg;
    }
    else if (node_type == "true") {
        SingleRegister reg = get_register();
        mips_instruction("li", get_register_name(reg), "1");
        node.id_register = reg;
    }
    else if (node_type == "id") {
        SingleRegister reg = node.sym->register_id;
        if (node.sym->kind == Kind::global_var) {
            if (parent_type == "=") {
                return;
            }
            reg = get_register();
            mips_instruction("lw", get_register_name(reg), node.sym->assembly_label);
        }
        else {
            reg = node.sym->register_id;
        }

        node.id_register = reg;
    }

    if (node_type != "OR" && node_type != "AND") {
        // We evaluate ourselves on a need to basis
        for (uint i = 0; i < node.branches.size(); i++)
        {
            evaluate_expressions(node.branches[i], node.type);
        }
    }

    if (node.type == "=")
    {
        Tree dest_node = node.branches[0];
        Tree arg_node = node.branches[1];
        SingleRegister dest = dest_node.id_register;
        SingleRegister arg1 = arg_node.id_register;

        if (arg_node.type == "id") {
            if (arg_node.sym->kind == Kind::global_var) {
                arg1 = get_register();
                mips_instruction("lw", get_register_name(arg1), arg_node.sym->assembly_label);
                // arg1 = get_register();
                // SingleRegister temp = get_register();
                // mips_instruction("la", get_register_name(temp), node.branches[1].sym->assembly_label);
                // mips_instruction("sw", get_register_name(arg1), "0(" + get_register_name(temp) + ")");
                // FREE_PRINT(temp)
                // register_pool.free_register(temp);

            }
        }

        if (dest_node.sym->kind == Kind::global_var) {
            dest = get_register();
            mips_instruction("la", get_register_name(dest), node.branches[0].sym->assembly_label);
            mips_instruction("sw", get_register_name(arg1), "0(" + get_register_name(dest) + ")");
            FREE_PRINT(dest)
            register_pool.free_register(dest);
        }
        else {

            mips_instruction("move", get_register_name(dest), get_register_name(arg1));
            NODE_LINE_NUMBER(node)
        }

        if (parent_type == "=" || parent_type == "return") {
            NODE_LINE_NUMBER(node)
                node.id_register = arg1;
        }
        else {
            if (arg_node.type == "id" && arg_node.sym->kind == Kind::global_var) {
                FREE_PRINT(arg1)
                    register_pool.free_register(arg1);
            }
            else {
                node.id_register = dest;
                free_node_register(arg_node);
            }
        }
    }
    else if (node.type == "!")
    {
        unary_operator(node);
    }
    else if (node.type == "+" || node.type == "*" || node.type == "/" || node.type == "%" || node.type == "<" || node.type == ">" || node.type == ">=" || node.type == "<=" || node.type == "==" || node.type == "!=")
    {
        tri_operator(node);
    }
    else if (node.type == "OR" || node.type == "AND") {
        synthesize(node);
    }
    else if (node.type == "-") {
        min_operator(node);
    }
    else if (node.type == "function_call")
    {
        function_call(node);
    }
}

void Synthesis::unary_operator(Tree& node)
{
    if (node.type != "!") return;
    SingleRegister arg1 = node.branches[0].id_register;
    SingleRegister dest = get_register();
    node.id_register = dest;
    mips_instruction("xori", get_register_name(dest), get_register_name(arg1), "1");
    // if (dest != arg1){
    free_node_register(node.branches[0]);
    // }
}

void Synthesis::min_operator(Tree& node) {
    if (node.type != "-") return;
    SingleRegister dest = get_register();
    SingleRegister arg1 = node.branches[0].id_register;
    if (node.branches.size() == 1) {
        mips_instruction("negu", get_register_name(dest), get_register_name(arg1));
    }
    else if (node.branches.size() == 2) {
        SingleRegister arg2 = node.branches[1].id_register;
        mips_instruction("subu", get_register_name(dest), get_register_name(arg1), get_register_name(arg2));
        // if (dest != arg2){
        free_node_register(node.branches[1]);
        // }
    }
    // if (dest != arg1){
    free_node_register(node.branches[0]);
    // }
    node.id_register = dest;

}

void Synthesis::tri_operator(Tree& node)
{
    SingleRegister arg1 = node.branches[0].id_register;
    SingleRegister arg2 = node.branches[1].id_register;

    SingleRegister dest = get_register();
    if (node.type == "*")
    {
        // TODO: Check for overflow?
        mips_instruction("mul", get_register_name(dest), get_register_name(arg1), get_register_name(arg2));
    }
    else if (node.type == "/" || node.type == "%")
    {
        std::string not_div_by_zero = get_label();
        mips_instruction("bnez", get_register_name(arg2), not_div_by_zero);
        mips_instruction("la", "$a0", "div_by_zero");
        mips_instruction("j", "error");
        add_label(not_div_by_zero);
        if (node.type == "/")
        {
            // TODO: Check for overflow?
            mips_instruction("div", get_register_name(dest), get_register_name(arg1), get_register_name(arg2));
        }
        else
        {
            mips_instruction("rem", get_register_name(dest), get_register_name(arg1), get_register_name(arg2));
        }
    }
    else if (node.type == "+")
    {
        mips_instruction("addu", get_register_name(dest), get_register_name(arg1), get_register_name(arg2));
    }
    else if (node.type == "<")
    {
        mips_instruction("slt", get_register_name(dest), get_register_name(arg1), get_register_name(arg2));
    }
    else if (node.type == ">")
    {
        mips_instruction("sgt", get_register_name(dest), get_register_name(arg1), get_register_name(arg2));
    }
    else if (node.type == "<=")
    {
        mips_instruction("sle", get_register_name(dest), get_register_name(arg1), get_register_name(arg2));
    }
    else if (node.type == ">=")
    {
        mips_instruction("sge", get_register_name(dest), get_register_name(arg1), get_register_name(arg2));
    }
    else if (node.type == "==")
    {
        mips_instruction("seq", get_register_name(dest), get_register_name(arg1), get_register_name(arg2));
    }
    else if (node.type == "!=")
    {
        mips_instruction("sne", get_register_name(dest), get_register_name(arg1), get_register_name(arg2));
    }
    else if (node.type == "AND")
    {
        // std::string label = get_label();
        // mips_instruction("move", get_register_name(dest), get_register_name(arg1));
        // mips_instruction("beqz", get_register_name(dest), label);
        // mips_instruction("move", get_register_name(dest), get_register_name(arg2));
        // add_label(label);
    }
    else if (node.type == "OR")
    {
        // std::string label = get_label();
        // mips_instruction("move", get_register_name(dest), get_register_name(arg1));
        // mips_instruction("bnez", get_register_name(dest), label);
        // mips_instruction("move", get_register_name(dest), get_register_name(arg2));
        // add_label(label);
    }

    free_node_register(node.branches[0]);

    free_node_register(node.branches[1]);
    node.id_register = dest;
}


void Synthesis::function_call(Tree& node) {
    // FIXME: Add saving registers and stuff this isn't done
    std::string function_to_call = node.branches[0].attr;
    SymbolEntry* entry = semantic.get_entry(function_to_call);
    std::string label_of_function_to_call = entry->assembly_label;
    // Save all variables on stack
    auto actuals = node.branches[1];
    for (uint i = 0; i < actuals.branches.size(); i++)
    {
        auto actual = actuals.branches[i];
        if (actual.type == "string")
        {
            std::string label = insert_into_data(actual.attr);
            mips_instruction("la", "$a" + std::to_string(i), label);
            NODE_LINE_NUMBER(actual);
        }
        else {
            SingleRegister temp = actual.id_register;
            if (actual.type == "=") {
                temp = actual.branches[0].id_register;
            }
            mips_instruction("move", "$a" + std::to_string(i), get_register_name(temp));
            if (actual.type != "=") {
                free_node_register(actual);
            }
            NODE_LINE_NUMBER(actual);
        }

    }

    int arg_amount = node.branches[1].branches.size();

    if (!part_of_runtime(function_to_call)) {
        dump_registers(arg_amount);
    }
    mips_instruction("jal", label_of_function_to_call);
    if (!part_of_runtime(function_to_call)) {
        recover_registers(arg_amount);
    }

    if (node.sig != "void") {
        SingleRegister reg = get_register();
        mips_instruction("move", get_register_name(reg), get_register_name(SingleRegister::$V0));
        node.id_register = reg;
    }
}

void Synthesis::dump_registers(uint arg_amount) {
    //  From $2 - $7  plus pool of registers 8-> not including count,
    text += "# REGISTER DUMP\n";
    for (uint i = 0; i < arg_amount; i++) {
        mips_instruction("addi", "$sp", "$sp", "-4");
        mips_instruction("sw", "$a" + std::to_string(i), "0($sp)");
    }

    for (auto itr = register_pool.used.begin(); itr != register_pool.used.end(); itr++) {
        mips_instruction("addi", "$sp", "$sp", "-4");
        mips_instruction("sw", get_register_name(*itr), "0($sp)");
    }
    text += "# REGISTER DUMP COMPLETE\n";

}

void Synthesis::recover_registers(uint arg_amount) {
    text += "# REGISTER RECOVERY\n";

    for (auto itr = register_pool.used.rbegin(); itr != register_pool.used.rend(); itr++) {
        mips_instruction("lw", get_register_name(*itr), "0($sp)");
        mips_instruction("addi", "$sp", "$sp", "4");
    }
    for (int i = arg_amount - 1; i > -1; i--) {
        mips_instruction("lw", "$a" + std::to_string(i), "0($sp)");
        mips_instruction("addi", "$sp", "$sp", "4");
    }
    text += "# REGISTER RECOVERY COMPLETE\n";
}

std::string Synthesis::insert_into_data(std::string str)
{
    std::string label_string = "string_" + get_label();
    data += label_string + ":\n";
    data += convert_string_to_bytes(str);
    return label_string;
}

std::string Synthesis::get_label()
{
    return "L" + std::to_string(label_count++);
}

std::string Synthesis::convert_string_to_bytes(std::string& str)
{
    // TODO: Null char check needed? Maybe
    std::string return_string = "\t.byte ";
    for (uint i = 0; i < str.size(); i++)
    {
        int x = int(str[i]);
        if (x == 92)
        { // If x is a slash
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
            return_string += " ";
    }
    if (int(str[str.size() - 1]) != 0) {
        return_string += " 0";
    }
    return_string += " # " + str;
    return_string += "\n\t.align 2\n";
    return return_string;
}

void Synthesis::mips_instruction(std::string instr, std::string c2, std::string c3, std::string c4)
{
    text += "\t" + instr + " " + c2;
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