#include "parser.hpp"

Parser::Parser(std::istream *file)
{
    scanner = std::make_unique<Scanner>(file);
}

Tree Parser::parse()
{
    scan_all_tokens();
    return start();
}

void Parser::error(std::string message)
{
    std::ostringstream stream;
    stream << message;
    stream << ", at or near line: ";
    stream << line_number << '\n';
    std::string m = stream.str();
    error_handler.NonRecoverableError(m);
}

void Parser::scan_all_tokens()
{
    Token tok;

    while ((tok = scanner->Scan()) != Token::T_EOF)
    {
        FullToken ftok = FullToken(tok, scanner->GetLine(), scanner->GetLexeme());
        all_tokens.push_back(ftok);
    }

    FullToken eof = FullToken(tok, scanner->GetLine(), scanner->GetLexeme());
    all_tokens.push_back(eof);
}

void Parser::consume_token()
{
    current_token_index++;
    FullToken ftok = all_tokens[current_token_index];
    nextToken = ftok.tok;
    lexeme = ftok.lexeme;
    line_number = ftok.line_number;
}

void Parser::putback_token()
{
    current_token_index--;
    FullToken ftok = all_tokens[current_token_index];
    nextToken = ftok.tok;
    lexeme = ftok.lexeme;
    line_number = ftok.line_number;
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
    consume_token();

    switch (nextToken)
    {
    case (Token::T_EOF):
        break;
    default:
        global_declarations(program);
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
        consume_token();
        tree.branches.push_back(Number(lexeme));
        break;
    case (Token::T_STRING):
        consume_token();
        tree.branches.push_back(String(lexeme));
        break;
    case (Token::T_TRUE):
        consume_token();
        tree.branches.push_back(TrueLiteral());
        break;
    case (Token::T_FALSE):
        consume_token();
        tree.branches.push_back(FalseLiteral());
        break;
    default:
        error("Expected a literal Token");
        break;
    }
}

// Append on type, boolean or int onto tree, consumes token
void Parser::type(Tree &tree)
{
    switch (nextToken)
    {
    case (Token::T_BOOLEAN):
        consume_token();
        tree.branches.push_back(Boolean());
        break;
    case (Token::T_INT):
        consume_token();
        tree.branches.push_back(Int());
        break;
    default:
        error("Expected a type ");
        break;
    }
}

void Parser::global_declarations(Tree &program)
{
    global_declaration(program);
    global_declarations_(program);
}

void Parser::global_declarations_(Tree &dec)
{
    if (nextToken == Token::T_ID || nextToken == Token::T_VOID || nextToken == Token::T_BOOLEAN || nextToken == Token::T_INT)
    {
        global_declaration(dec);
        global_declarations_(dec);
    }
}

void Parser::global_declaration(Tree &tree)
{
    if (nextToken == Token::T_ID)
    {
        main_function_declaration(tree);
    }
    else if (nextToken == Token::T_VOID)
    {
        function_decleration(tree);
    }
    else if (nextToken == Token::T_BOOLEAN || nextToken == Token::T_INT)
    {
        // Perform a look ahead to check that the third icon is ;
        // because that indicates we have a variable declaration
        //  either have function declaration
        consume_token();
        consume_token();
        if (nextToken == Token::T_SEMICOLON)
        {
            putback_token();
            putback_token();
            variable_declaration(tree);
        }
        else
        {
            putback_token();
            putback_token();
            function_decleration(tree);
        }
    }
}

void Parser::variable_declaration(Tree &tree)
{
    if (nextToken == Token::T_BOOLEAN || nextToken == Token::T_INT)
    {
        Tree var_dec = VariableDeclaration();

        type(var_dec);
        identifier(var_dec);

        if (nextToken == Token::T_SEMICOLON)
        {
            consume_token();
            var_dec.branches.push_back(SemiColon());
        }
        else
        {
            error("Variable declaration missing ;, ");
        }
        tree.branches.push_back(var_dec);
    }

    return;
}

// Pushes back an identifier, consumes the token
void Parser::identifier(Tree &tree)
{
    if (nextToken == Token::T_ID)
    {
        consume_token();
        Identifier id = Identifier(lexeme);
        id.line_number = line_number;
        tree.branches.push_back(id);
    }
}

// Pushes a full function declartion onto Tree
void Parser::function_decleration(Tree &tree)
{
    Tree func_dec = FunctionDeclaration("");

    function_header(func_dec);
    block(func_dec);
    tree.branches.push_back(func_dec);
}

void Parser::function_header(Tree &func_dec)
{

    switch (nextToken)
    {
    case Token::T_BOOLEAN:
        type(func_dec);
        break;
    case Token::T_INT:
        type(func_dec);
        break;
    case Token::T_VOID:
        consume_token();
        func_dec.branches.push_back(Void());
        break;
    default:
        return;
        break;
    }

    function_declarator(func_dec);
}

void Parser::function_declarator(Tree &func_dec)
{
    identifier(func_dec);

    if (nextToken == Token::T_LEFTPARANTHESE)
    {
        consume_token();
        if (nextToken == Token::T_RIGHTPARANTHESE)
        {
            consume_token();
        }
        else
        {
            formal_parameter_list(func_dec);
            if (nextToken == Token::T_RIGHTPARANTHESE)
            {
                consume_token();
            }
        }
    }
    else
    {
        error("Expected left ( for function declaration ");
    }
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
        consume_token();
        formal_parameter(func_dec);
        formal_parameter_list_(func_dec);
    }
}

void Parser::formal_parameter(Tree &func_dec)
{
    type(func_dec);
    identifier(func_dec);
}

void Parser::main_function_declaration(Tree &tree)
{
    Tree main = FunctionDeclaration("main");
    if (nextToken != Token::T_ID)
    {
        return;
    }
    main.line_number = line_number;
    main_function_declarator(main);
    block(main);
    tree.branches.push_back(main);
}

void Parser::main_function_declarator(Tree &tree)
{
    identifier(tree);
    if (nextToken == Token::T_LEFTPARANTHESE)
    {
        consume_token();
        if (nextToken == Token::T_RIGHTPARANTHESE)
        {
            consume_token();
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
        consume_token();
        if (nextToken == Token::T_RIGHTBRACE)
        {
            consume_token();
            tree.branches.push_back(block_node);
        }
        else
        {

            block_statements(block_node);
            if (nextToken == Token::T_RIGHTBRACE)
            {
                consume_token();
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
        variable_declaration(tree);
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
        consume_token();
        return;
        break;
    case Token::T_ID:
        statement_expression(statement_tree);
        break;
    case Token::T_BREAK:
        consume_token();
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
        consume_token();
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
        consume_token();
        statement_tree.branches.push_back(If());

        if (nextToken == Token::T_LEFTPARANTHESE)
        {
            consume_token();
            expression(statement_tree);
            if (nextToken == Token::T_RIGHTPARANTHESE)
            {
                consume_token();
                statement(statement_tree);
                if (nextToken == Token::T_ELSE)
                {
                    consume_token();
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
        consume_token();
        if (nextToken == Token::T_LEFTPARANTHESE)
        {
            consume_token();
            expression(statement_tree);
            if (nextToken == Token::T_RIGHTPARANTHESE)
            {
                consume_token();
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
    function_invocation(tree);
    assignment(tree);
}

// Retruns a primary
void Parser::primary(Tree &express)
{
    Tree prim = Primary();
    // Checks for literal types
    if (nextToken == Token::T_NUMBER || nextToken == Token::T_STRING || nextToken == Token::T_TRUE || nextToken == Token::T_FALSE)
    {
        literal(express);
        // return prim;
    }
    // Check for (
    else if (nextToken == Token::T_LEFTPARANTHESE)
    {
        consume_token();
        expression(express); // TODO: check how this is done

        if (nextToken == Token::T_RIGHTPARANTHESE)
        {
            consume_token();
            // return prim;
        }
        else
        {
            // TODO: Throw error expected a )
        }
    }
    // Check for indentifier, in this case don't consume the token
    else if (nextToken == Token::T_ID)
    {
        function_invocation(express); // TODO: Check how this works
        // return prim;
    }
    else
    {
        // TODO: Error incorrect primary type given, what was expected
        // return; Empty();
    }
    return;
    Empty();
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
        consume_token();
        expression(args);
        argument_list_(args);
    }
}

void Parser::function_invocation(Tree &tree)
{
    Tree func_inv = FunctionInvocation();
    if (nextToken == Token::T_ID)
    {
        identifier(func_inv);
        if (nextToken == Token::T_LEFTPARANTHESE)
        {
            consume_token();
            if (nextToken == Token::T_RIGHTPARANTHESE)
            {
                consume_token();
                tree.branches.push_back(func_inv);
            }
            else
            {
                func_inv.branches.push_back(argument_list());
                if (nextToken == Token::T_RIGHTPARANTHESE)
                {
                    consume_token();
                    tree.branches.push_back(func_inv);
                }
                else
                {
                    error("Syntax error function call missing (, ");
                }
            }
        }
        else
        {
            error("Syntax error function call missing ), ");
        }
    }
}

void Parser::post_fix_expression(Tree &express)
{

    // TODO: Check if its primmary
    primary(express);
    identifier(express);
    // return post;
}

void Parser::unary_expression(Tree &express)
{
    if (nextToken == Token::T_MINUS)
    {
        consume_token();
        Tree min = Minus();
        express.branches.push_back(min);
        unary_expression(min);
    }
    else if (nextToken == Token::T_NOT)
    {
        consume_token();
        Tree no = Not();
        express.branches.push_back(no);
        unary_expression(no);
    }
    else
    {
        post_fix_expression(express);
        // un.branches.push_back(post_fix_expression());
    }

    return;
}

void Parser::multiplicative_expression(Tree &express)
{
    unary_expression(express);
    multiplicative_expression_(express);
}

void Parser::multiplicative_expression_(Tree &express)
{
    if (nextToken == Token::T_MULTIPLY)
    {

        consume_token();
        Tree multiply = Multiply();
        express.branches.push_back(multiply);
        unary_expression(multiply);
        multiplicative_expression_(multiply);
    }
    else if (nextToken == Token::T_DIVIDE)
    {

        consume_token();
        Tree divide = Divide();
        express.branches.push_back(divide);
        unary_expression(divide);
        multiplicative_expression_(divide);
    }
    else if (nextToken == Token::T_MODULUS)
    {

        consume_token();
        Tree modulus = Modulus();
        express.branches.push_back(modulus);
        unary_expression(modulus);
        multiplicative_expression_(modulus);
    }

    return;
}

void Parser::additive_expression(Tree &express)
{
    multiplicative_expression(express);
    additive_expression_(express);
}

void Parser::additive_expression_(Tree &express)
{
    if (nextToken == Token::T_ADD)
    {
        consume_token();
        Tree add = Add();
        express.branches.push_back(add);
        multiplicative_expression(add);
        additive_expression_(add);
    }
    else if (nextToken == Token::T_MINUS)
    {
        consume_token();
        Tree min = Minus();
        express.branches.push_back(min);
        multiplicative_expression(min);
        additive_expression_(min);
    }
}

void Parser::relational_expression(Tree &express)
{
    additive_expression(express);
    relational_expression_(express);
}

void Parser::relational_expression_(Tree &express)
{
    if (nextToken == Token::T_LESSTHAN)
    {
        consume_token();
        Tree lessthan = LessThan();
        express.branches.push_back(lessthan);
        additive_expression(lessthan);
        relational_expression_(lessthan);
    }
    else if (nextToken == Token::T_GREATERTHAN)
    {
        consume_token();
        Tree greaterthan = GreaterThan();
        express.branches.push_back(greaterthan);
        additive_expression(greaterthan);
        relational_expression_(greaterthan);
    }
    else if (nextToken == Token::T_LESSTHANEQUAL)
    {
        consume_token();
        Tree lessthanequal = LessThanEqual();
        express.branches.push_back(lessthanequal);
        additive_expression(lessthanequal);
        relational_expression_(lessthanequal);
    }
    else if (nextToken == Token::T_GREATERTHANEQUAL)
    {
        consume_token();
        Tree greaterthanequal = GreaterThanEqual();
        express.branches.push_back(greaterthanequal);
        additive_expression(greaterthanequal);
        relational_expression_(greaterthanequal);
    }
}

void Parser::equality_expression(Tree &express)
{
    relational_expression(express);
    equality_expression_(express);
}

void Parser::equality_expression_(Tree &express)
{
    if (nextToken == Token::T_EQUAL)
    {
        consume_token();
        Tree equal = Equal();
        express.branches.push_back(equal);
        relational_expression(equal);
        equality_expression_(equal);
    }
    else if (nextToken == Token::T_NOTEQUAL)
    {
        consume_token();
        Tree notequal = NotEqual();
        express.branches.push_back(notequal);
        relational_expression(notequal);
        equality_expression_(notequal);
    }
}

void Parser::conditional_and_expression(Tree &express)
{
    equality_expression(express);
    conditional_and_expression_(express);
}

void Parser::conditional_and_expression_(Tree &express)
{
    if (nextToken == Token::T_AND)
    {
        consume_token();
        Tree and_node = And();
        express.branches.push_back(and_node);
        equality_expression(and_node);
        conditional_and_expression_(and_node);
    }
}

void Parser::conditional_or_expression(Tree &express)
{

    conditional_and_expression(express);
    conditional_or_expression_(express);
}

void Parser::conditional_or_expression_(Tree &express)
{
    if (nextToken == Token::T_OR)
    {
        consume_token();
        Tree or_node = Or();
        express.branches.push_back(or_node);
        conditional_and_expression(or_node);
        conditional_or_expression_(or_node);
    }
}

// Returns a tree node, type empty if it could not make one
// TODO: make this work correctly
void Parser::assignment(Tree &express)
{
    Tree assignment = Assignment();
    assignment.line_number = line_number;

    if (nextToken == Token::T_ID)
    {
        identifier(assignment);
        if (nextToken == Token::T_ASSIGN)
        {
            consume_token();
            assignment_expression(assignment);
        }
        else
        {
            error("Expected an 'assign' token, ");
        }
        express.branches.push_back(assignment);
    }
}

void Parser::assignment_expression(Tree &express)
{
    conditional_or_expression(express);
    assignment(express);
}

void Parser::expression(Tree &tree)
{

    // TODO: complete this function
    // Tree expression_tree = Expression();
    assignment_expression(tree);
    // tree.branches.push_back(expression_tree);
}