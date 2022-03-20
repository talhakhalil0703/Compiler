#include "semantic.hpp"

// information to store for a symbol entry
//  name of symbol, the kind that it is, and its type

SymbolTable::SymbolTable()
{
}

SymbolEntry::SymbolEntry()
{
}

Semantic::Semantic(Tree &tree) : program(tree)
{
    analyze();
}

void Semantic::analyze()
{
    global_declarations();
    return;
}

void Semantic::global_declarations()
{
    if (program.type == "program")
    {
        std::vector<Tree> &global_decs = program.branches;
        for (uint i = 0; i < global_decs.size(); i++)
        {
            // Create entry here, must put into table
            SymbolEntry entry = SymbolEntry();

            if (global_decs[i].type == "global_variable_declaration")
            {
                entry.kind = Kind::global_var;
            }
            else if (global_decs[i].type == "main_declaration")
            {
                entry.kind = Kind::func;
            }
            else if (global_decs[i].type == "function_declaration")
            {
                entry.kind = Kind::func;
            }
            else
            {
                // something isn't right here, our program shouldn't put us here
            }

            std::string name = get_name(global_decs[i]);
            std::string type_string = get_type(global_decs[i]);
            entry.name = name;
            entry.type = type_string;

            table.enteries.insert(std::make_pair(name, entry));
        }
    }
}

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

std::string Semantic::get_type(Tree &node, bool is_function)
{
    // TODO: FOR NOW WE DO NOT HANDLE ARGUMENTS
    std::string type_string;

    // Potential types are void, boolean, and int
    // Ignore string case for now, because techincally that is not a type

    for (uint j = 0; j < node.branches.size(); j++)
    {
        if (node.branches[j].type != "int" && node.branches[j].type != "boolean" && node.branches[j].type != "void")
        {
            continue;
        }
        type_string = node.branches[j].type;
    }

    return type_string;
    // If we have a function then it must have a return and argument type
    // Arguments should be split using ,
    // Parameters vs Return should be seperated using args -> return
}