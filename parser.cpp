#include "parser.hpp"

Parser::Parser(std::istream *file)
{
    scanner = std::make_unique<Scanner>(file);
}

Tree Parser::parse()
{
    return start();
}

void Parser::error(std::string message)
{
    std::ostringstream stream;
    stream << message;
    stream << ", at or near line: ";
    stream << scanner->GetLine() << '\n';
    std::string m = stream.str();
    error_handler.NonRecoverableError(m);
}

void Parser::consumeToken()
{
    lexeme = scanner->GetLexeme();
    nextToken = scanner->Scan();
}

bool Parser::token_in_statement_function(Token tok)
{
    switch (tok)
    {
    case Token::T_BOOLEAN:
    case Token::T_INT:
    case Token::T_LEFTBRACE:
    case Token::T_SEMICOLON:
    case Token::T_ID:
    case Token::T_BREAK:
    case Token::T_RETURN:
    case Token::T_IF:
    case Token::T_WHILE:
        return true;

    default:
        return false;
    }
}

Tree Parser::start()
{
    Tree program = Program();
    program.line_number = 0;
    consumeToken();

    switch (nextToken)
    {
    case (Token::T_EOF):
        break;
    default:
        global_declarations(program);
        // program.branches.push_back(global_declarations());
        break;
    }

    return program;
}

// Literals , consumes its own token adds onto tree does not return
void Parser::literal(Tree &tree)
{
    Token tok = nextToken;
    switch (tok)
    {
    case (Token::T_NUMBER):
        consumeToken();
        tree.branches.push_back(Number(scanner->GetLexeme()));
        break;
    case (Token::T_STRING):
        consumeToken();
        tree.branches.push_back(String(scanner->GetLexeme()));
        break;
    case (Token::T_TRUE):
        consumeToken();
        tree.branches.push_back(TrueLiteral());
        break;
    case (Token::T_FALSE):
        consumeToken();
        tree.branches.push_back(FalseLiteral());
        break;
    default:
        std::ostringstream stream;
        stream << "Expected a literal Token at Line: ";
        stream << scanner->GetLine() << '\n';
        std::string m = stream.str();
        error_handler.NonRecoverableError(m);
        break;
    }
}

// Append on type, boolean or int onto tree, consumes token
void Parser::type(Tree &tree)
{
    switch (nextToken)
    {
    case (Token::T_BOOLEAN):
        consumeToken();
        tree.branches.push_back(Boolean());
        break;
    case (Token::T_INT):
        consumeToken();
        tree.branches.push_back(Int());
        break;
    default:
        std::ostringstream stream;
        stream << "Expected a type  at Line: ";
        stream << scanner->GetLine() << '\n';
        std::string m = stream.str();
        error_handler.NonRecoverableError(m);
        break;
    }
}

void Parser::global_declarations(Tree &program)
{
    Tree dc = global_declaration();
    program.branches.push_back(dc);
    global_declarations_(program);
}

void Parser::global_declarations_(Tree &dec)
{
    Tree gd = Tree();
    gd = global_declaration();
    if (gd.type != "empty")
    {
        dec.branches.push_back(global_declaration());
        global_declarations_(dec);
    }
}

Tree Parser::global_declaration()
{
    Tree dec = Tree();
    dec = variable_declaration();

    if (dec.type != "empty")
    {
        return dec;
    }

    dec = function_decleration();
    // TODO: Never empty in this case
    if (dec.type != "empty")
    {
        return dec;
    }

    dec = main_function_declaration();
    if (dec.type != "empty")
    {
        return dec;
    }

    return Empty();
}

Tree Parser::variable_declaration()
{
    if (nextToken != Token::T_BOOLEAN && nextToken != Token::T_INT)
    {
        return Empty();
    }

    Tree var_dec = VariableDeclaration();

    type(var_dec);
    identifier(var_dec);

    if (nextToken == Token::T_SEMICOLON)
    {
        consumeToken();
        var_dec.branches.push_back(SemiColon());
    }
    else
    {
        return Empty();
        // TODO: Error Statement, expected a semicolon
    }

    return var_dec;
}

// Pushes back an identifier, consumes the token
void Parser::identifier(Tree &tree)
{
    if (nextToken == Token::T_ID)
    {
        consumeToken();
        Identifier id = Identifier(lexeme);
        id.line_number = scanner->GetLine();
        tree.branches.push_back(id);
    }
}

// Pushes a full function declartion onto Tree
Tree Parser::function_decleration()
{
    Tree func_dec = FunctionDeclaration("");

    func_dec = function_header();
    if (func_dec.type == "empty")
    {
        return Empty();
    }
    block(func_dec);
    return func_dec;
}

Tree Parser::function_header()
{
    Tree func_dec = FunctionDeclaration("");

    switch (nextToken)
    {
    case Token::T_BOOLEAN:
        type(func_dec);
        break;
    case Token::T_INT:
        type(func_dec);
        break;
    case Token::T_VOID:
        consumeToken();
        func_dec.branches.push_back(Void());
        break;
    default:
        return Empty();
        break;
    }

    function_declarator(func_dec);
    return func_dec;
}

Tree Parser::function_declarator(Tree &func_dec)
{
    identifier(func_dec);

    if (nextToken == Token::T_LEFTPARANTHESE)
    {
        consumeToken();
        if (nextToken == Token::T_RIGHTPARANTHESE)
        {
            consumeToken();
            return func_dec;
        }
        else
        {
            formal_parameter_list(func_dec);
            if (nextToken == Token::T_RIGHTPARANTHESE)
            {
                consumeToken();
                return func_dec;
                // } else
                // TODO: Error expected right parantheses
            }
        }
    }
    else
    {
        return Empty();
        // TODO: Error expected left parantheses
    }
    return Empty();
}

void Parser::formal_parameter_list(Tree &func_dec)
{
    formal_parameter(func_dec);
    formal_parameter_list_(func_dec);
}

void Parser::formal_parameter_list_(Tree &func_dec)
{
    if (nextToken == Token::T_COMMA)
    {
        consumeToken();
        formal_parameter(func_dec);
        formal_parameter_list_(func_dec);
    }
}

void Parser::formal_parameter(Tree &func_dec)
{
    type(func_dec);
    identifier(func_dec);
}

Tree Parser::main_function_declaration()
{
    Tree main = FunctionDeclaration("main");
    if (nextToken != Token::T_ID)
    {
        return Empty();
    }
    main.line_number = scanner->GetLine();
    main_function_declarator(main);
    block(main);

    return main;
}

void Parser::main_function_declarator(Tree &tree)
{
    identifier(tree);
    if (nextToken == Token::T_LEFTPARANTHESE)
    {
        consumeToken();
        if (nextToken == Token::T_RIGHTPARANTHESE)
        {
            consumeToken();
        }
        else
        {
            error("Syntax error, probably missing ), for main function");
        }
    }
    else
    {
        error("Syntax error, probably missing (, for main function");
    }
}

void Parser::block(Tree &tree)
{
    Block block_node = Block();

    if (nextToken == Token::T_LEFTBRACE)
    {
        consumeToken();
        if (nextToken == Token::T_RIGHTBRACE)
        {
            consumeToken();
            tree.branches.push_back(block_node);
        }
        else
        {

            block_statements(block_node);
            if (nextToken == Token::T_RIGHTBRACE)
            {
                consumeToken();
                tree.branches.push_back(block_node);
            }
            else
            {
                error("Syntax error, probably missing } for block statement");
            }
        }
    }
    else
    {
        error("Syntax error, probably missing { for block statement");
    }
}

void Parser::block_statements(Tree &tree)
{
    block_statement(tree);
    block_statements_(tree);
}

void Parser::block_statements_(Tree &tree)
{
    if (token_in_statement_function(nextToken))
    {
        block_statement(tree);
        block_statements_(tree);
    }
}

void Parser::block_statement(Tree &tree)
{
    if (nextToken == Token::T_BOOLEAN || nextToken == Token::T_INT)
    {
        tree.branches.push_back(variable_declaration());
    }
    else
    {
        statement(tree);
    }
}

void Parser::statement(Tree &tree)
{
    Tree statement_tree = Statement();
    switch (nextToken)
    {
    case Token::T_LEFTBRACE:
        block(tree);
        break;
    case Token::T_SEMICOLON:
        consumeToken();
        return;
        break;
    case Token::T_ID:
        statement_expression(statement_tree);
        break;
    case Token::T_BREAK:
        consumeToken();
        if (nextToken == Token::T_SEMICOLON)
        {
            statement_tree.branches.push_back(Break());
        }
        else
        {
            // TODO: Error Missing semi colon
        }
        break;
    case Token::T_RETURN:
        consumeToken();
        if (nextToken == Token::T_SEMICOLON)
        {
            statement_tree.branches.push_back(Return());
        }
        else
        {
            statement_tree.branches.push_back(Return());
            expression(statement_tree);
            if (nextToken == Token::T_SEMICOLON)
            {
            }
            else
            {
                // TODO:: Error missing semi colon
            }
        }
        break;
    case Token::T_IF:
        consumeToken();
        statement_tree.branches.push_back(If());

        if (nextToken == Token::T_LEFTPARANTHESE)
        {
            consumeToken();
            expression(statement_tree);
            if (nextToken == Token::T_RIGHTPARANTHESE)
            {
                consumeToken();
                statement(statement_tree);
                if (nextToken == Token::T_ELSE)
                {
                    consumeToken();
                    statement(statement_tree);
                }
                else
                {
                    break;
                }
            }
            else
            {
                // TODO: Error expected right )
            }
        }
        else
        {
            // TODO: Error expected left (
        }
        break;
    case Token::T_WHILE:
        consumeToken();
        if (nextToken == Token::T_LEFTPARANTHESE)
        {
            consumeToken();
            expression(statement_tree);
            if (nextToken == Token::T_RIGHTPARANTHESE)
            {
                consumeToken();
                statement(statement_tree);
            }
            else
            {
                // TODO: Error expected right )
            }
        }
        else
        {
            // TODO: Error expected left (
        }
        break;
    default:
        // TODO: Error invalid statement type given.
        // error("Syntax Error");
        break;
    }

    tree.branches.push_back(statement_tree);
}

void Parser::statement_expression(Tree &tree)
{
    Tree temp_tree = Tree();

    temp_tree = assignment();
    if (temp_tree.type == "empty")
    {
        temp_tree = function_invocation();
    }

    if (temp_tree.type == "empty")
    {
        // TODO: Throw error of incorrect statement type
    }

    tree.branches.push_back(temp_tree);
}

// Retruns a primary
Tree Parser::primary()
{
    Tree prim = Primary();
    // Checks for literal types
    if (nextToken == Token::T_NUMBER || nextToken == Token::T_STRING || nextToken == Token::T_TRUE || nextToken == Token::T_FALSE)
    {
        literal(prim);
        return prim;
    }
    // Check for (
    else if (nextToken == Token::T_LEFTPARANTHESE)
    {
        consumeToken();
        expression(prim); // TODO: check how this is done

        if (nextToken == Token::T_RIGHTPARANTHESE)
        {
            consumeToken();
            return prim;
        }
        else
        {
            // TODO: Throw error expected a )
        }
    }
    // Check for indentifier, in this case don't consume the token
    else if (nextToken == Token::T_ID)
    {
        prim.branches.push_back(function_invocation()); // TODO: Check how this works
        return prim;
    }
    else
    {
        // TODO: Error incorrect primary type given, what was expected
        return Empty();
    }
    return Empty();
}

Tree Parser::argument_list()
{
    Tree argument_list = ArgumentList();
    expression(argument_list);
    argument_list_(argument_list);
    return argument_list;
}

void Parser::argument_list_(Tree &args)
{
    if (nextToken == Token::T_COMMA)
    {
        consumeToken();
        expression(args);
        argument_list_(args);
    }
}

Tree Parser::function_invocation()
{
    Tree func_inv = FunctionInvocation();
    identifier(func_inv);
    if (nextToken == Token::T_LEFTPARANTHESE)
    {
        consumeToken();
        if (nextToken == Token::T_RIGHTPARANTHESE)
        {
            consumeToken();
            return func_inv;
        }
        else
        {
            func_inv.branches.push_back(argument_list());
            if (nextToken == Token::T_RIGHTPARANTHESE)
            {
                consumeToken();
                return func_inv;
            }
            else
            {
                // TODO: Error missing left )
            }
        }
    }
    else
    {
        // TODO: Error missing left (
    }

    return Empty();
}

Tree Parser::post_fix_expression()
{

    // TODO: Check if its primmary
    Tree post = Tree();
    post = primary();

    if (post.type == "empty")
    {
        post = Tree();
        identifier(post);
    }

    return post;
}

Tree Parser::unary_expression()
{
    Tree un = UnaryExpression();
    if (nextToken == Token::T_MINUS)
    {
        consumeToken();
        Tree min = Minus();
        min.branches.push_back(unary_expression());
        un.branches.push_back(min);
    }
    else if (nextToken == Token::T_NOT)
    {
        consumeToken();
        Tree no = Not();
        no.branches.push_back(unary_expression());
        un.branches.push_back(no);
    }
    else
    {
        un.branches.push_back(post_fix_expression());
    }

    return un;
}

Tree Parser::multiplicative_expression()
{
    Tree express = Expression();
    express.branches.push_back(unary_expression());
    multiplicative_expression_(express);
    return express;
}

void Parser::multiplicative_expression_(Tree &tree)
{
    switch (nextToken)
    {
    case Token::T_MULTIPLY:
        consumeToken();
        tree.branches.push_back(Multiply());
        tree.branches.push_back(unary_expression());
        multiplicative_expression_(tree);
        break;
    case Token::T_DIVIDE:
        consumeToken();
        tree.branches.push_back(Divide());
        tree.branches.push_back(unary_expression());
        multiplicative_expression_(tree);
        break;
    case Token::T_MODULUS:
        consumeToken();
        tree.branches.push_back(Modulus());
        tree.branches.push_back(unary_expression());
        multiplicative_expression_(tree);
        break;
    default:
        break;
    }
}

Tree Parser::additive_expression()
{
    Tree express = Expression();
    express.branches.push_back(multiplicative_expression());
    additive_expression_(express);
    return express;
}

void Parser::additive_expression_(Tree &express)
{
    switch (nextToken)
    {
    case Token::T_ADD:
        consumeToken();
        express.branches.push_back(Add());
        express.branches.push_back(multiplicative_expression());
        additive_expression_(express);
        break;
    case Token::T_MINUS:
        consumeToken();
        express.branches.push_back(Minus());
        express.branches.push_back(multiplicative_expression());
        additive_expression_(express);
        break;
    default:
        break;
    }
}

Tree Parser::relational_expression()
{
    Tree express = Expression();
    express.branches.push_back(additive_expression());
    relational_expression_(express);
    return express;
}

void Parser::relational_expression_(Tree &express)
{
    switch (nextToken)
    {
    case Token::T_LESSTHAN:
        consumeToken();
        express.branches.push_back(LessThan());
        express.branches.push_back(additive_expression());
        relational_expression_(express);
        break;
    case Token::T_GREATERTHAN:
        consumeToken();
        express.branches.push_back(GreaterThan());
        express.branches.push_back(additive_expression());
        relational_expression_(express);
        break;
    case Token::T_LESSTHANEQUAL:
        consumeToken();
        express.branches.push_back(LessThanEqual());
        express.branches.push_back(additive_expression());
        relational_expression_(express);
        break;
    case Token::T_GREATERTHANEQUAL:
        consumeToken();
        express.branches.push_back(GreaterThanEqual());
        express.branches.push_back(additive_expression());
        relational_expression_(express);
        break;

    default:
        break;
    }
}

Tree Parser::equality_expression()
{
    Tree express = Expression();
    express.branches.push_back(relational_expression());
    equality_expression_(express);
    return express;
}

void Parser::equality_expression_(Tree &express)
{
    switch (nextToken)
    {
    case Token::T_EQUAL:
        consumeToken();
        express.branches.push_back(Equal());
        express.branches.push_back(relational_expression());
        equality_expression_(express);
        break;
    case Token::T_NOTEQUAL:
        consumeToken();
        express.branches.push_back(NotEqual());
        express.branches.push_back(relational_expression());
        equality_expression_(express);
        break;
    default:
        break;
    }
}

Tree Parser::conditional_and_expression()
{
    Tree express = Expression();
    express.branches.push_back(equality_expression());
    conditional_and_expression_(express);
    return express;
}

void Parser::conditional_and_expression_(Tree &express)
{
    if (nextToken == Token::T_AND)
    {
        consumeToken();
        express.branches.push_back(And());
        express.branches.push_back(equality_expression());
        conditional_and_expression_(express);
    }
    return;
}

Tree Parser::conditional_or_expression()
{
    Tree express = Expression();
    express.branches.push_back(conditional_and_expression());
    conditional_or_expression_(express);
    return express;
}

void Parser::conditional_or_expression_(Tree &express)
{
    if (nextToken == Token::T_OR)
    {
        consumeToken();
        express.branches.push_back(Or());
        express.branches.push_back(conditional_and_expression());
        conditional_or_expression_(express);
    }
}

Tree Parser::assignment_expression()
{
    Tree express = Expression();
    express = assignment();
    if (express.type == "empty")
    {
        express = conditional_and_expression();
    }
    return express;
}

// Returns a tree node, type empty if it could not make one
// TODO: make this work correctly
Tree Parser::assignment()
{
    Tree assignment = Assignment();

    if (nextToken == Token::T_ID)
    {
        consumeToken();
        assignment.branches.push_back(Identifier(scanner->GetLexeme()));
        if (nextToken == Token::T_ASSIGN)
        {
            consumeToken();
            assignment.branches.push_back(assignment_expression());
            return assignment;
        }
        else
        {
            error("Expected an 'assign' token, ");
        }
    }

    return Empty();
}

void Parser::expression(Tree &tree)
{

    // TODO: complete this function
    Tree expression_tree = Expression();
    expression_tree.branches.push_back(assignment_expression());
    tree.branches.push_back(expression_tree);
}