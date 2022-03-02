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
    if (nextToken == Token::T_NUMBER)
    {
        Tree num = Number(lexeme);
        num.line_number = line_number;
        tree.branches.push_back(num);
        consume_token();
    }
    else if (nextToken == Token::T_STRING)
    {
        Tree str = String(lexeme);
        str.line_number = line_number;
        tree.branches.push_back(str);
        consume_token();
    }
    else if (nextToken == Token::T_TRUE)
    {
        Tree tr = TrueLiteral();
        tr.line_number = line_number;
        tree.branches.push_back(tr);
        consume_token();
    }
    else if (nextToken == Token::T_FALSE)
    {
        Tree fl = FalseLiteral();
        fl.line_number = line_number;
        tree.branches.push_back(fl);
        consume_token();
    }
}

// Append on type, boolean or int onto tree, consumes token
void Parser::type(Tree &tree)
{
    switch (nextToken)
    {
    case (Token::T_BOOLEAN):
        tree.branches.push_back(Boolean());
        consume_token();
        break;
    case (Token::T_INT):
        tree.branches.push_back(Int());
        consume_token();
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
        Identifier id = Identifier(lexeme);
        id.line_number = line_number;
        tree.branches.push_back(id);
        consume_token();
    }
}

// Pushes a full function declartion onto Tree
void Parser::function_decleration(Tree &tree)
{
    Tree func_dec = FunctionDeclaration();

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
        func_dec.branches.push_back(Void());
        consume_token();
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
            Tree formals = FormalList();
            func_dec.branches.push_back(formals);
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
    Tree formals = FormalList();
    formal_parameter(formals);
    formal_parameter_list_(formals);
    func_dec.branches.push_back(formals);
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
    Tree main = MainDeclaration();
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
            Tree formals = FormalList();
            tree.branches.push_back(formals);
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
                // error("Syntax error, probably missing } for block statement");
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
    statement_tree.line_number = line_number;

    if (nextToken == Token::T_LEFTBRACE)
    {
        block(tree);
    }
    else if (nextToken == Token::T_SEMICOLON)
    {
        // Checking if the statement is a null state
        putback_token();
        if (nextToken == Token::T_LEFTBRACE || nextToken == Token::T_RIGHTPARANTHESE || nextToken == Token::T_ELSE)
        {
            consume_token();
            Tree null_statement = NullStatement();
            null_statement.line_number = line_number;
            tree.branches.push_back(null_statement);
        }
        else
        {
            consume_token();
        }

        consume_token();
    }
    else if (nextToken == Token::T_ID)
    {
        statement_expression(statement_tree);
        tree.branches.push_back(statement_tree);
    }
    else if (nextToken == Token::T_BREAK)
    {

        consume_token();
        if (nextToken == Token::T_SEMICOLON)
        {
            statement_tree.branches.push_back(Break());
        }
        else
        {
            error("Syntax error missing ;");
        }
        tree.branches.push_back(statement_tree);
    }
    else if (nextToken == Token::T_RETURN)
    {

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
                error("Missing ;");
            }
        }

        tree.branches.push_back(statement_tree);
    }
    else if (nextToken == Token::T_IF)
    {

        Tree if_token = If();
        if_token.line_number = line_number;
        consume_token();

        if (nextToken == Token::T_LEFTPARANTHESE)
        {
            consume_token();
            expression(if_token);
            if (nextToken == Token::T_RIGHTPARANTHESE)
            {
                consume_token();
                statement(if_token);
                if (nextToken == Token::T_ELSE)
                {
                    consume_token();
                    statement(if_token);
                    Tree ifelse = IfElse();
                    ifelse.line_number = if_token.line_number;
                    ifelse.branches = if_token.branches;
                    if_token = ifelse;
                }
            }
            else
            {
                error("Syntax error expected )");
            }
        }
        else
        {
            error("Syntax error expected (");
        }
        tree.branches.push_back(if_token);
    }
    else if (nextToken == Token::T_WHILE)
    {

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
                error("Syntax error expected )");
            }
        }
        else
        {
            error("Syntax error expected (");
        }
        tree.branches.push_back(statement_tree);
    }
}

void Parser::statement_expression(Tree &tree)
{
    consume_token();
    if (nextToken == Token::T_ASSIGN)
    {
        putback_token();
        assignment(tree);
    }
    else
    {
        putback_token();
        function_invocation(tree);
    }
}

// Retruns a primary
void Parser::primary(Tree &express)
{
    // Checks for literal types
    if (nextToken == Token::T_NUMBER || nextToken == Token::T_STRING || nextToken == Token::T_TRUE || nextToken == Token::T_FALSE)
    {
        literal(express);
    }
    // Check for (
    else if (nextToken == Token::T_LEFTPARANTHESE)
    {
        consume_token();
        expression(express);

        if (nextToken == Token::T_RIGHTPARANTHESE)
        {
            consume_token();
        }
        else
        {
            error("Syntax error, expected )");
        }
    }
    // Check for indentifier, in this case don't consume the token
    else if (nextToken == Token::T_ID)
    {
        function_invocation(express);
    }
}

void Parser::argument_list(Tree &func_inv)
{
    Tree argument_list = ArgumentList();
    expression(argument_list);
    argument_list_(argument_list);
    func_inv.branches.push_back(argument_list);
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
    func_inv.line_number = line_number;
    if (nextToken == Token::T_ID)
    {
        identifier(func_inv);
        if (nextToken == Token::T_LEFTPARANTHESE)
        {
            consume_token();
            if (nextToken == Token::T_RIGHTPARANTHESE)
            {
                consume_token();
                Tree argument_list = ArgumentList();
                func_inv.branches.push_back(argument_list);
                tree.branches.push_back(func_inv);
            }
            else
            {
                argument_list(func_inv);
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
            // error("Syntax error function call missing )");
        }
    }
}

void Parser::post_fix_expression(Tree &express)
{
    primary(express);
    identifier(express);
}

void Parser::unary_expression(Tree &express)
{
    if (nextToken == Token::T_MINUS)
    {
        Tree min = Minus();
        min.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        min.branches.push_back(other_node);
        consume_token();
        unary_expression(min);
        express.branches.push_back(min);
    }
    else if (nextToken == Token::T_NOT)
    {
        Tree no = Not();
        no.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        no.branches.push_back(other_node);
        consume_token();
        unary_expression(no);
        express.branches.push_back(no);
    }
    else
    {
        post_fix_expression(express);
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
        Tree multiply = Multiply();
        multiply.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        multiply.branches.push_back(other_node);
        consume_token();
        unary_expression(multiply);
        multiplicative_expression_(multiply);
        express.branches.push_back(multiply);
    }
    else if (nextToken == Token::T_DIVIDE)
    {
        Tree divide = Divide();
        divide.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        divide.branches.push_back(other_node);
        consume_token();
        unary_expression(divide);
        multiplicative_expression_(divide);
        express.branches.push_back(divide);
    }
    else if (nextToken == Token::T_MODULUS)
    {
        Tree modulus = Modulus();
        modulus.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        modulus.branches.push_back(other_node);
        consume_token();
        unary_expression(modulus);
        multiplicative_expression_(modulus);
        express.branches.push_back(modulus);
    }
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
        Tree add = Add();
        add.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        add.branches.push_back(other_node);
        consume_token();
        multiplicative_expression(add);
        additive_expression_(add);
        express.branches.push_back(add);
    }
    else if (nextToken == Token::T_MINUS)
    {
        Tree min = Minus();
        min.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        min.branches.push_back(other_node);
        consume_token();
        multiplicative_expression(min);
        additive_expression_(min);
        express.branches.push_back(min);
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
        Tree lessthan = LessThan();
        lessthan.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        lessthan.branches.push_back(other_node);
        consume_token();
        additive_expression(lessthan);
        relational_expression_(lessthan);
        express.branches.push_back(lessthan);
    }
    else if (nextToken == Token::T_GREATERTHAN)
    {
        Tree greaterthan = GreaterThan();
        greaterthan.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        greaterthan.branches.push_back(greaterthan);
        consume_token();
        additive_expression(greaterthan);
        relational_expression_(greaterthan);
        express.branches.push_back(greaterthan);
    }
    else if (nextToken == Token::T_LESSTHANEQUAL)
    {
        Tree lessthanequal = LessThanEqual();
        lessthanequal.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        lessthanequal.branches.push_back(other_node);
        consume_token();
        additive_expression(lessthanequal);
        relational_expression_(lessthanequal);
        express.branches.push_back(lessthanequal);
    }
    else if (nextToken == Token::T_GREATERTHANEQUAL)
    {
        Tree greaterthanequal = GreaterThanEqual();
        greaterthanequal.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        greaterthanequal.branches.push_back(other_node);
        consume_token();
        additive_expression(greaterthanequal);
        relational_expression_(greaterthanequal);
        express.branches.push_back(greaterthanequal);
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
        Tree equal = Equal();
        equal.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        equal.branches.push_back(other_node);
        consume_token();
        relational_expression(equal);
        equality_expression_(equal);
        express.branches.push_back(equal);
    }
    else if (nextToken == Token::T_NOTEQUAL)
    {
        Tree notequal = NotEqual();
        notequal.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        notequal.branches.push_back(other_node);
        consume_token();
        relational_expression(notequal);
        equality_expression_(notequal);
        express.branches.push_back(notequal);
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
        Tree and_node = And();
        and_node.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        and_node.branches.push_back(other_node);
        consume_token();
        equality_expression(and_node);
        conditional_and_expression_(and_node);
        express.branches.push_back(and_node);
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
        Tree or_node = Or();
        or_node.line_number = line_number;
        Tree other_node = express.branches.back();
        express.branches.pop_back();
        or_node.branches.push_back(other_node);
        consume_token();
        conditional_and_expression(or_node);
        conditional_or_expression_(or_node);
        express.branches.push_back(or_node);
    }
}

// Returns a tree node, type empty if it could not make one
// TODO: make this work correctly
void Parser::assignment(Tree &express)
{
    Tree assignment = Assignment();

    if (nextToken == Token::T_ID)
    {
        identifier(assignment);
        if (nextToken == Token::T_ASSIGN)
        {
            assignment.line_number = line_number;
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
    assignment_expression(tree);
}