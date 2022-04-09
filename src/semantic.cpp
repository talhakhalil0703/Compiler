#include "semantic.hpp"

Semantic::Semantic(Tree &tree) : program(tree)
{
    analyze();
}

void Semantic::analyze()
{
    memory_stack.push_back(&table);
    run_time_library_enteries();
    global_declarations(table.get_entry("program")->inner_scope);
    id_identification(program, table);
    type_checking(program);
    function_checking(program);
    return;
}

void Semantic::run_time_library_enteries(){
    //printi
    SymbolEntry entry = SymbolEntry();
    entry.kind = Kind::func;
    entry.name = "printi";
    entry.type = "f(int)";
    entry.return_type = "void";
    entry.inner_scope = new SymbolTable();
    SymbolEntry arg = SymbolEntry();
    arg.name = "i";
    arg.kind = Kind::arg;
    arg.type = "int";
    entry.inner_scope->insert_entry("i", arg);
    table.insert_entry("printi", entry);

    //printc
    entry = SymbolEntry();
    entry.kind = Kind::func;
    entry.name = "printc";
    entry.type = "f(int)";
    entry.return_type = "void";
    entry.inner_scope = new SymbolTable();
    arg = SymbolEntry();
    arg.name = "c";
    arg.kind = Kind::arg;
    arg.type = "int";
    entry.inner_scope->insert_entry("c", arg);
    table.insert_entry("printc", entry);

    //printb
    entry = SymbolEntry();
    entry.kind = Kind::func;
    entry.name = "printb";
    entry.type = "f(boolean)";
    entry.return_type = "void";
    entry.inner_scope = new SymbolTable();
    arg = SymbolEntry();
    arg.name = "b";
    arg.kind = Kind::arg;
    arg.type = "boolean";
    entry.inner_scope->insert_entry("b", arg);
    table.insert_entry("printb", entry);

    //prints
    entry = SymbolEntry();
    entry.kind = Kind::func;
    entry.name = "prints";
    entry.type = "f(string)";
    entry.return_type = "void";
    entry.inner_scope = new SymbolTable();
    arg = SymbolEntry();
    arg.name = "s";
    arg.kind = Kind::arg;
    arg.type = "string";
    entry.inner_scope->insert_entry("s", arg);
    table.insert_entry("prints", entry);

    //halt
    entry = SymbolEntry();
    entry.kind = Kind::func;
    entry.name = "halt";
    entry.type = "f()";
    entry.return_type = "void";
    table.insert_entry("halt", entry);

    //getchar
    entry = SymbolEntry();
    entry.kind = Kind::func;
    entry.name = "getchar";
    entry.type = "f()";
    entry.return_type = "int";
    table.insert_entry("getchar", entry);

    SymbolEntry program = SymbolEntry();
    program.name = "program";
    program.inner_scope = new SymbolTable();
    table.insert_entry("program", program);
    memory_stack.push_back(program.inner_scope);
}

void Semantic::error(std::string message, Tree &node)
{
    std::ostringstream stream;
    stream << "error: " << message << " at or near line " << node.line_number << "\n";
    error_handler.NonRecoverableError(stream.str());
}

void Semantic::error(std::string message)
{
    std::ostringstream stream;
    stream << "error: " << message << "\n";
    error_handler.NonRecoverableError(stream.str());
}

SymbolEntry *Semantic::get_entry(std::string name)
{
    SymbolTable *lookup_table;
    for (uint i = 0; i < memory_stack.size(); i++)
    {
        lookup_table = memory_stack[memory_stack.size() - 1 - i];
        auto ent = lookup_table->enteries.find(name);
        if (ent != lookup_table->enteries.end())
        {
            return &ent->second;
        }
    }

    return nullptr;
}

void Semantic::global_declarations(SymbolTable *program_table)

{
    if (program_table == nullptr){
        error("no program found");
    }

    if (program.type == "program")
    {
        program.sym = get_entry("program");
        std::vector<Tree> &global_decs = program.branches;
        for (uint i = 0; i < global_decs.size(); i++)
        {
            // Create entry here, must put into table
            SymbolEntry entry = SymbolEntry();
            std::string name = get_name(global_decs[i]);

            if (global_decs[i].type == "global_variable_declaration")
            {
                entry.kind = Kind::global_var;
                entry.type = get_type(global_decs[i]);
            }
            else if (global_decs[i].type == "main_declaration")
            {
                entry.kind = Kind::func;
                entry.type = get_type(global_decs[i], true);
                entry.return_type = "void";
                main_decl++;

                if (main_decl > 1){
                    error("'main' redefined", global_decs[i]);
                }
            }
            else if (global_decs[i].type == "function_declaration")
            {
                entry.kind = Kind::func;
                entry.type = get_type(global_decs[i], true);
                entry.return_type = get_type(global_decs[i]);
            }
            else
            {
                // something isn't right here, our program shouldn't put us here
            }

            Tree *node_type = get_id(global_decs[i]);

            if (node_type)
            {
                node_type->sig = entry.type;
            }
            else
            {
                // Error
            }

            entry.name = name;
            if (!program_table->insert_entry(name, entry))
            {
                if (global_decs[i].type == "global_variable_declaration")
                {
                    error("Redefining variable", global_decs[i]);
                }
                else if (global_decs[i].type == "function_declaration")
                {
                    error("Redefining function", global_decs[i]);
                }
            }

            node_type->sym = program_table->get_entry(name);
        }
    }

    if (main_decl == 0)
    {
        error("no main declaration found");
    }
}

/*
Given an item that should have an Id attribute return that attribute by reference
*/
Tree *Semantic::get_id(Tree &node)
{
    for (uint i = 0; i < node.branches.size(); i++)
    {
        if (node.branches[i].type == "id")
        {
            return &node.branches[i];
        }
    }

    return nullptr;
}

void Semantic::id_identification(Tree &node, SymbolTable &table)
{
    /*What types are enteries to symbol table?
        1. Arguments are basically declarations,
        2. Variable declarations,
        Not function declarations because we cannot declare anymore!

        The rest we should be able to find within our symbol table. If we cannot
        then they are not declared
    */
    if (node.type == "block")
    {
        scope_depth++;
        // node.sig = "Depth" + std::to_string(block_depth);
    }

    if (node.type == "while")
    {
        while_count++;
    }

    if (node.type == "break")
    {
        break_count++;
        if (while_count != break_count)
        {
            error("break must be inside 'while'", node);
        }
    }

    if (node.type == "formal" || node.type == "variable_declaration")
    {
        // Insert into symbol table
        if (node.type == "variable_declaration" && scope_depth > 1)
        {
            error("local declaration not in outermost block", node);
        }
        SymbolEntry entry;
        Tree *id;
        id = get_id(node);
        if (node.type == "formal")
        {
            entry.kind = Kind::arg;
        }
        else
        {
            entry.kind = Kind::var;
        }
        entry.name = id->attr;
        entry.type = get_type(node);
        node.sig = entry.type;

        if (id)
        {
            id->sig = entry.type;
        }
        else
        {
            // Error
        }

        if (!table.insert_entry(id->attr, entry))
        {
            error("'" + id->attr + "' redefined", node);
        }

        id->sym = table.get_entry(id->attr);
        return;
    }
    else if (node.type == "function_call")
    {
        Tree *func_id = get_id(node);
        SymbolEntry *symbol = get_entry(func_id->attr);
        if (symbol != nullptr)
        {
            if (func_id->sym != nullptr)
            {
                func_id->sym = symbol;
                // I know what the signature is because of the symbol
                func_id->sig = symbol->type;
            }
            node.sig = symbol->return_type;
        }
        else
        {
            error("unknown identifier' " + func_id->attr + "'", node);
        }
    }
    else if (node.type == "id" && node.sym == nullptr)
    { // We have an id without a reference
        SymbolEntry *symbol = get_entry(node.attr);
        if (symbol != nullptr)
        {
            node.sym = symbol;
            // I know what the signature is because of the symbol
            node.sig = symbol->type;
        }
        else
        {
            error("unknown identifier' " + node.attr + "'", node);
        }
    }

    for (uint i = 0; i < node.branches.size(); i++)
    {
        if (node.type == "main_declaration" || node.type == "function_declaration")
        {
            SymbolTable *scope;
            SymbolEntry *table_entry = get_entry(get_name(node));

            if (table_entry->inner_scope == nullptr)
            {
                table_entry->inner_scope = new SymbolTable();
            }

            scope = table_entry->inner_scope;
            memory_stack.push_back(scope);
            id_identification(node.branches[i], *scope);
            memory_stack.pop_back();
        }
        else
        {
            id_identification(node.branches[i], table);
        }
    }

    if (node.type == "block")
    {
        scope_depth--;
    }

    if (node.type == "while")
    {
        while_count--;
    }
    if (node.type == "break")
    {
        break_count--;
    }
}

/*
Get the name of the current node. This is the attr value attached to the id
*/
std::string Semantic::get_name(Tree &node)
{
    std::string name;
    for (uint j = 0; j < node.branches.size(); j++)
    {
        if (node.branches[j].type != "id")
        {
            continue;
        }
        name = node.branches[j].attr;
    }

    return name;
}

/* If we have a function then it must have a return and argument type
Arguments should be split using ','
arguments vs Return should be seperated using args -> return
*/
std::string Semantic::get_type(Tree &node, bool is_function)
{
    std::ostringstream type_string;

    if (is_function)
    {
        type_string << "f(";
        for (uint j = 0; j < node.branches.size(); j++)
        {
            if (node.branches[j].type != "formals")
            {
                continue;
            }
            std::vector<Tree> &arguments_node = node.branches[j].branches;
            for (uint i = 0; i < arguments_node.size(); i++)
            {
                type_string << get_type(arguments_node[i]);
                if (i != (arguments_node.size() - 1))
                {
                    type_string << ", ";
                }
                else
                {
                    break;
                }
            }
        }

        type_string << ")";
        return type_string.str();
    }
    // Potential types are void, boolean, and int
    // Ignore string case for now, because techincally that is not a type

    for (uint j = 0; j < node.branches.size(); j++)
    {
        if (node.branches[j].type != "int" && node.branches[j].type != "boolean" && node.branches[j].type != "void")
        {
            continue;
        }
        type_string << node.branches[j].type;
    }

    return type_string.str();
}

bool Semantic::is_operator(Tree &node)
{
    if (node.type == "=")
        return true;
    if (node.type == "-")
        return true;
    if (node.type == "!")
        return true;
    if (node.type == "*")
        return true;
    if (node.type == "/")
        return true;
    if (node.type == "+")
        return true;
    if (node.type == "%")
        return true;
    if (node.type == "<")
        return true;
    if (node.type == "<=")
        return true;
    if (node.type == ">")
        return true;
    if (node.type == ">=")
        return true;
    if (node.type == "==")
        return true;
    if (node.type == "!=")
        return true;
    if (node.type == "AND")
        return true;
    if (node.type == "OR")
        return true;
    return false;
}

void Semantic::type_checking(Tree &node)
{
    if(node.branches.size() == 0 && node.sig != ""){
        return;
    } else{
        for (uint i = 0; i < node.branches.size(); i++)
        {
            type_checking(node.branches[i]);   
        }
    }

    if (is_operator(node) || node.type == "if" || node.type == "while")
    {
        std::vector<std::string> type_to_check;
        for (uint i = 0; i < node.branches.size(); i++)
        {
            if (node.branches[i].sig == "")
            {
                type_checking(node.branches[i]);
            }
            type_to_check.push_back(node.branches[i].sig);
        }

        if (node.type == "OR" || node.type == "AND")
        {
            and_or_operator(node, type_to_check);
        }
        else if (node.type == "==" || node.type == "!=")
        {
            equality_operator(node, type_to_check);
        }
        else if (node.type == "<" || node.type == ">" || node.type == ">=" || node.type == "<=")
        {
            comparison_operator(node, type_to_check);
        }
        else if (node.type == "+" || node.type == "*" || node.type == "/" || node.type == "%")
        {
            arithmetic_operator(node, type_to_check);
        }
        else if (node.type == "-")
        {
            min_operator(node, type_to_check);
        }
        else if (node.type == "!")
        {
            not_operator(node, type_to_check);
        }
        else if (node.type == "=")
        {
            assignment_operator(node, type_to_check);
        } else if(node.type == "if"){
            //First branch of if is its expression
            if (node.branches[0].sig != "boolean"){
                error("need a boolean expression", node);
            }
        }else if(node.type == "while"){
            //First branch of while is its expression
            if (node.branches[0].sig != "boolean"){
                error("need a boolean expression", node);
            }
        }
        else
        {
            // No idea
        }
    }
    else
    {
        for (uint i = 0; i < node.branches.size(); i++)
        {
            type_checking(node.branches[i]);
        }
    }
}

void Semantic::and_or_operator(Tree &node, std::vector<std::string> args)
{
    if (args.size() != 2)
    {
        error("Expected more branches", node);
    }

    if (args[0] != "boolean" || args[1] != "boolean")
    {
        error("Type mismatch for '" + node.type + "'", node);
    }
    node.sig = "boolean";
}

void Semantic::equality_operator(Tree &node, std::vector<std::string> args)
{
    if (args.size() != 2)
    {
        error("Expected more branches", node);
    }

    if (args[0] != args[1])
    {
        error("Type mismatch for '" + node.type + "'", node);
    }
    node.sig = "boolean";
}

void Semantic::comparison_operator(Tree &node, std::vector<std::string> args)
{
    if (args.size() != 2)
    {
        error("Expected more branches", node);
    }

    if (args[0] != "int" || args[1] != "int")
    {
        error("Type mismatch for '" + node.type + "'", node);
    }
    node.sig = "boolean";
}

void Semantic::arithmetic_operator(Tree &node, std::vector<std::string> args)
{
    if (args.size() != 2)
    {
        error("Expected more branches", node);
    }

    if (args[0] != "int" || args[1] != "int")
    {
        error("Type mismatch for '" + node.type + "'", node);
    }
    node.sig = "int";
}

void Semantic::min_operator(Tree &node, std::vector<std::string> args)
{
    if (args[0] != "int")
    {
        error("Type mismatch must args, expected int", node);
    }
    if (args.size() == 2 && args[1] != "int")
    {
        error("Type mismatch for '" + node.type + "'", node);
    }
    node.sig = "int";
}

void Semantic::not_operator(Tree &node, std::vector<std::string> args)
{
    if (args[0] != "boolean")
    {
        error("Type mismatch for '" + node.type + "'", node);
    }

    node.sig = "boolean";
}

void Semantic::assignment_operator(Tree &node, std::vector<std::string> args)
{
    if (args.size() != 2)
    {
        error("Expected more branches", node);
    }

    if (args[0] != args[1])
    {
        error("Type mismatch for '" + node.type + "'", node);
    }

    node.sig = args[0];
}

void Semantic::function_checking(Tree &node)
{
    if (node.type == "function_declaration" || node.type == "main_declaration")
    {
        function_declaration_checks(node);
    }
    if (node.type == "function_call")
    {
        function_call_checks(node);
    }

    for (uint i = 0; i < node.branches.size(); i++)
    {
        function_checking(node.branches[i]);
    }
}

void Semantic::function_call_checks(Tree &node)
{
    Tree *func_cal_id = get_id(node);
    SymbolEntry *entry = func_cal_id->sym;
    if (func_cal_id->attr == "main")
    {
        error("cannot call main", node);
    }

    for (uint i = 0; i < node.branches.size(); i++)
    {
        if (node.branches[i].type != "actuals")
        {
            continue;
        }
        std::vector<std::string> args;
        extract_function_argument_type(entry->type, args);
        if (args.size() != node.branches[i].branches.size())
        {
            error("number/type of arguments doesn't match function declaration", node);
        }

        for (uint j = 0; j < args.size(); j++)
        {
            std::string arg1 = args[j];
            std::string comp_arg = node.branches[i].branches[j].sig;

            if (arg1 != comp_arg)
            {
                error("number/type of arguments doesn't match function declaration", node);
            }
        }
    }
}

void Semantic::extract_function_argument_type(std::string type_string, std::vector<std::string> &args)
{
    type_string.replace(0, 2, "");
    type_string.replace(type_string.end() - 1, type_string.end(), "");

    //Multiple
    int start = 0;
    int end = type_string.find(",");
    while (end != -1)
    {
        args.push_back(type_string.substr(start, end - start));
        start = end + 2; //account for space in between 
        end = type_string.find(",", start);
        type_string = type_string.substr(start, end);
    }

    if(type_string.find(",") == std::string::npos){
        if (type_string != ""){
            args.push_back(type_string);
        }
        return;
    }
}

void Semantic::aggregate_returns(Tree &node, std::vector<std::string> &found_returns, std::string expected)
{
    if (node.type == "return")
    {
        if (expected == "void" || expected == "")
        {
            if (node.branches.size() > 0)
            {
                error("this function can't return a value", node);
            }
        }
        else
        {
            if (node.branches.size() > 0)
            {
                std::string signature = node.branches[0].sig;
                if (signature != expected)
                {
                    error("returned value has the wrong type", node);
                }
                found_returns.push_back(signature);
            }
            else
            {
                error("this function must return a value", node);
            }
        }
    }
    else
    {
        for (uint i = 0; i < node.branches.size(); i++)
        {
            aggregate_returns(node.branches[i], found_returns, expected);
        }
    }
}

void Semantic::function_declaration_checks(Tree &node)
{
    Tree *func_dec_id = get_id(node);
    std::string return_type = func_dec_id->sym->return_type;
    std::vector<std::string> returns;
    // Now make a note of all returns
    for (uint i = 0; i < node.branches.size(); i++)
    {
        aggregate_returns(node.branches[i], returns, return_type);
    }

    if (return_type != "" && return_type != "void" && returns.size() == 0)
    {
        error("no return statement in non-void function '" + func_dec_id->attr + "'");
    }
}
