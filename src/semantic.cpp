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
            }
            else if (global_decs[i].type == "function_declaration")
            {
                entry.kind = Kind::func;
                entry.type = get_type(global_decs[i], true);
            }
            else
            {
                // something isn't right here, our program shouldn't put us here
            }

            entry.name = name;

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
    std::ostringstream type_string;

    if (is_function)
    {
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
                    type_string << "->";
                }
            }
        }
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
    // If we have a function then it must have a return and argument type
    // Arguments should be split using ,
    // Parameters vs Return should be seperated using args -> return
}