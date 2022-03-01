#ifndef TREE
#define TREE
#include <vector>
#include <string>
class Tree
{
public:
    std::vector<Tree> branches = {};
    int line_number;
    std::string attr;
    std::string tree_type;

protected:
};

class Program : public Tree
{
public:
    Program()
    {
        tree_type = "program";
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
        tree_type = "number";
    }
};

class String : public Tree
{
public:
    String(std::string str)
    {
        attr = str;
        tree_type = "string";
    }
};

class TrueLiteral : public Tree
{
public:
    TrueLiteral()
    {
        tree_type = "true";
    }
};

class FalseLiteral : public Tree
{
public:
    FalseLiteral()
    {
        tree_type = "false";
    }
};

class Int : public Tree
{
public:
    Int()
    {
        tree_type = "int";
    }
};

class Boolean : public Tree
{
public:
    Boolean()
    {
        tree_type = "boolean";
    }
};

class VariableDeclaration : public Tree
{
public:
    VariableDeclaration()
    {
        tree_type = "variable_declaration";
    }
};

class FunctionDeclaration : public Tree
{
public:
    FunctionDeclaration(std::string name)
    {
        tree_type = "function_declaration";
        attr = name;
    }
};

class Identifier : public Tree
{
public:
    Identifier(std::string id)
    {
        tree_type = "identifier";
        attr = id;
    }
};

class SemiColon : public Tree
{
public:
    SemiColon()
    {
        tree_type = "semi_colon";
    }
};

class Void : public Tree
{
public:
    Void()
    {
        tree_type = "void";
    }
};

class Statement : public Tree
{
public:
    Statement()
    {
        tree_type = "statement";
    }
};

class Break : public Tree
{
public:
    Break()
    {
        tree_type = "break";
    }
};

class Return : public Tree
{
public:
    Return()
    {
        tree_type = "return";
    }
};

class If : public Tree
{
public:
    If()
    {
        tree_type = "if";
    }
};

class Assignment : public Tree
{
public:
    Assignment()
    {
        tree_type = "assignment";
    }
};

class Expression : public Tree
{
public:
    Expression()
    {
        tree_type = "expression";
    }
};

class ArgumentList : public Tree
{
public:
    ArgumentList()
    {
        tree_type = "argument_list";
    }
};

class Primary : public Tree
{
public:
    Primary()
    {
        tree_type = "primary";
    }
};

class UnaryExpression : public Tree
{
public:
    UnaryExpression()
    {
        tree_type = "unary";
    }
};

class Minus : public Tree
{
public:
    Minus()
    {
        tree_type = "minus";
    }
};

class Not : public Tree
{
public:
    Not()
    {
        tree_type = "not";
    }
};

class Multiply : public Tree
{
public:
    Multiply()
    {
        tree_type = "multiply";
    }
};

class Divide : public Tree
{
public:
    Divide()
    {
        tree_type = "divide";
    }
};

class Add : public Tree
{
public:
    Add()
    {
        tree_type = "add";
    }
};

class Modulus : public Tree
{
public:
    Modulus()
    {
        tree_type = "modulus";
    }
};

class LessThan : public Tree
{
public:
    LessThan()
    {
        tree_type = "less_than";
    }
};

class LessThanEqual : public Tree
{
public:
    LessThanEqual()
    {
        tree_type = "less_than_equal";
    }
};

class GreaterThan : public Tree
{
public:
    GreaterThan()
    {
        tree_type = "greater_than";
    }
};

class GreaterThanEqual : public Tree
{
public:
    GreaterThanEqual()
    {
        tree_type = "greater_than_equal";
    }
};

class FunctionInvocation : public Tree
{
public:
    FunctionInvocation()
    {
        tree_type = "function_invocation";
    }
};

class Equal : public Tree
{
public:
    Equal()
    {
        tree_type = "equal";
    }
};

class NotEqual : public Tree
{
public:
    NotEqual()
    {
        tree_type = "not_equal";
    }
};

class And : public Tree
{
public:
    And()
    {
        tree_type = "and";
    }
};

class Or : public Tree
{
public:
    Or()
    {
        tree_type = "or";
    }
};
// Used for error checking because do not want to deal with null types
// We can instead compare and check the type property to determine if
// the node is empty
class Empty : public Tree
{
public:
    Empty()
    {
        tree_type = "empty";
    }
};

#endif
