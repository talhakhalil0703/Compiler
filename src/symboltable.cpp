#include "symboltable.hpp"
// information to store for a symbol entry
//  name of symbol, the kind that it is, and its type

SymbolEntry::SymbolEntry()
{
}

std::string SymbolEntry::print(int tab_amount)
{
    std::ostringstream stream;
    for (int i = 0; i < tab_amount; i++)
    {
        stream << "\t";
    }

    stream << "name: '" << name << "' Kind: '" << getName(kind) << "' Type: '";
    stream << type << "'";
    if (return_type != "")
    {
        stream << " 'return' " << return_type;
    }
    stream << "\n";

    if (inner_scope != NULL)
    {
        stream << inner_scope->print(tab_amount + 1);
    }

    return stream.str();
}

SymbolTable::SymbolTable()
{
}

std::string SymbolTable::print(int tab_amount)
{
    std::ostringstream stream;
    for (auto &entry : enteries)
    {
        stream << entry.second.print(tab_amount);
    }

    return stream.str();
}

SymbolEntry *SymbolTable::get_entry(std::string name)
{
    auto it = enteries.find(name);
    if (it != enteries.end())
    {
        return &it->second;
    }

    return nullptr;
}

bool SymbolTable::insert_entry(std::string name, SymbolEntry entry)
{
    if (get_entry(name) == nullptr)
    {
        enteries.insert(std::make_pair(name, entry));
        return true;
    }
    return false;
}
