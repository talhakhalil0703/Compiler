#ifndef TREE
#define TREE
#include <vector>
#include <string>
#include <iostream>
#include <sstream>
#include "symboltable.hpp"

class Tree
{
public:
    std::vector<Tree> branches = {};
    int line_number = -1; // Value of -1 indicates that this is garbage
    std::string attr;     // "" indicates it has no attribute
    std::string type;
    std::string sig;
    SymbolEntry *sym = nullptr;

    void print(int tab_amount)
    {
        std::ostringstream stream;
        for (int i = 0; i < tab_amount; i++)
        {
            stream << "\t";
        }
        stream << type << " {";
        if (attr != "")
        {
            stream << "'attr': '" << attr << "', ";
        }
        if (sym != nullptr)
        {
            stream << "'sym': <" << sym << ">, ";
        }
        if (sig != "")
        {
            stream << "'sig': '" << sig << "', ";
        }
        if (line_number != -1)
        {
            stream << "'lineno': " << line_number << ", ";
        }

        stream << "'type': "
               << "'" << type << "'";
        stream << "}\n";

        std::cout << stream.str();

        for (uint i = 0; i < branches.size(); i++)
        {
            branches[i].print(tab_amount + 1);
        }
    }

protected:
};

class Program : public Tree
{
public:
    Program()
    {
        type = "program";
    }
};

class StatementExpression : public Tree
{
};

class Number : public Tree
{
public:
    Number(std::string number)
    {
        attr = number;
        type = "number";
        sig = "int";
    }
};

class String : public Tree
{
public:
    String(std::string str)
    {
        attr = str;
        type = "string";
    }
};

class TrueLiteral : public Tree
{
public:
    TrueLiteral()
    {
        type = "true";
        sig = "boolean";
    }
};

class FalseLiteral : public Tree
{
public:
    FalseLiteral()
    {
        type = "false";
        sig = "boolean";
    }
};

class Int : public Tree
{
public:
    Int()
    {
        type = "int";
        sig = "int";
    }
};

class Boolean : public Tree
{
public:
    Boolean()
    {
        type = "boolean";
        sig = "boolean";
    }
};

class GlobalVariableDeclaration : public Tree
{
public:
    GlobalVariableDeclaration()
    {
        type = "global_variable_declaration";
    }
};

class VariableDeclaration : public Tree
{
public:
    VariableDeclaration()
    {
        type = "variable_declaration";
    }
};

class FunctionDeclaration : public Tree
{
public:
    FunctionDeclaration()
    {
        type = "function_declaration";
    }
};

class MainDeclaration : public Tree
{
public:
    MainDeclaration()
    {
        type = "main_declaration";
    }
};

class Identifier : public Tree
{
public:
    Identifier(std::string id)
    {
        type = "id";
        attr = id;
    }
};

class Void : public Tree
{
public:
    Void()
    {
        type = "void";
    }
};

class Statement : public Tree
{
public:
    Statement()
    {
        type = "statement";
    }
};

class NullStatement : public Tree
{
public:
    NullStatement()
    {
        type = "null_statement";
    }
};

class Break : public Tree
{
public:
    Break()
    {
        type = "break";
    }
};

class Return : public Tree
{
public:
    Return()
    {
        type = "return";
    }
};

class If : public Tree
{
public:
    If()
    {
        type = "if";
    }
};

class IfElse : public Tree
{
public:
    IfElse()
    {
        type = "if_else";
    }
};

class While : public Tree
{
public:
    While()
    {
        type = "while";
    }
};

class Assignment : public Tree
{
public:
    Assignment()
    {
        type = "=";
    }
};

class ArgumentList : public Tree
{
public:
    ArgumentList()
    {
        type = "actuals";
    }
};

class FormalList : public Tree
{
public:
    FormalList()
    {
        type = "formals";
    }
};

class Formal : public Tree
{
public:
    Formal()
    {
        type = "formal";
    }
};

class Minus : public Tree
{
public:
    Minus()
    {
        type = "-";
    }
};

class Not : public Tree
{
public:
    Not()
    {
        type = "!";
    }
};

class Multiply : public Tree
{
public:
    Multiply()
    {
        type = "*";
    }
};

class Divide : public Tree
{
public:
    Divide()
    {
        type = "/";
    }
};

class Add : public Tree
{
public:
    Add()
    {
        type = "+";
    }
};

class Modulus : public Tree
{
public:
    Modulus()
    {
        type = "%";
    }
};

class LessThan : public Tree
{
public:
    LessThan()
    {
        type = "<";
    }
};

class LessThanEqual : public Tree
{
public:
    LessThanEqual()
    {
        type = "<=";
    }
};

class GreaterThan : public Tree
{
public:
    GreaterThan()
    {
        type = ">";
    }
};

class GreaterThanEqual : public Tree
{
public:
    GreaterThanEqual()
    {
        type = ">=";
    }
};

class FunctionInvocation : public Tree
{
public:
    FunctionInvocation()
    {
        type = "function_call";
    }
};

class Equal : public Tree
{
public:
    Equal()
    {
        type = "==";
    }
};

class NotEqual : public Tree
{
public:
    NotEqual()
    {
        type = "!=";
    }
};

class And : public Tree
{
public:
    And()
    {
        type = "AND";
    }
};

class Or : public Tree
{
public:
    Or()
    {
        type = "OR";
    }
};

class Block : public Tree
{
public:
    Block()
    {
        type = "block";
    }
};

#endif
