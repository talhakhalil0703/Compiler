#include "semantic.hpp"
#include "errorhandler.hpp"

Semantic::Semantic(Tree &tree) : program(tree)
{
    analyze();
}

void Semantic::analyze()
{
    memory_stack.push_back(&table);
    global_declarations();
    id_identification(program, table);
    return;
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
            if (!table.insert_entry(name, entry))
            {
                if (global_decs[i].type == "main_declaration")
                {
                    error("'main' redefined", global_decs[i]);
                }
                else if (global_decs[i].type == "global_variable_declaration")
                {
                    error("Redefining variable", global_decs[i]);
                }
                else if (global_decs[i].type == "function_declaration")
                {
                    error("Redefining function", global_decs[i]);
                }
            }

            node_type->sym = table.get_entry(name);
        }
    }

    if (table.get_entry("main") == nullptr)
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

    if (node.type == "formal" || node.type == "variable_declaration")
    {
        // Insert into symbol table
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
            error("Variable already declared in current scope", node);
        }

        id->sym = table.get_entry(id->attr);
        return;
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
            error("An undecalred identifier is used", node);
        }
    }

    for (uint i = 0; i < node.branches.size(); i++)
    {
        if (node.type == "main_declaration" || node.type == "function_declaration")
        {
            SymbolTable *scope;
            SymbolEntry *table_entry = table.get_entry(get_name(node));

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