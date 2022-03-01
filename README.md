# CPSC 411- Compiler

A J-- (Java subset) compiler.

To build the compiler simple run make.

Compiler usage: main [filename]

### Tests

#### Scanner Tests
1. Ensures that regular text can be read
2. Ensures that an empty file is a valid file
3. Ensures the input is correctly read as comments
4. Ensures numbers are correctly read, negative numbers are not considered
5. Ensures identifiers are correctly found
6. Ensures all operators are correctly found
7. Ensures all strings are read correctly

#### Parser Tests
8. Ensures an empty main function can be paresed correctly
9. Syntax error for main missing right bracket
10. Syntax error for main missing left bracket
11. Syntax error for main right parantheses
12. Syntax error for main left parantheses
13. Syntax error for main missing parantheses
14. Syntax error for main missing brackets
15. Ensures main can be a one liner
16. Ensures a main function with a variable assignment to number works

### Grammar of J-- Specification

start           : /* empty */
                | globaldeclarations
                ;

literal         : NUMBER
                | STRING
                | TRUE
                | FALSE
                ;

type            : BOOLEAN
                | INT
                ;

globaldeclarations      : globaldeclaration
                        | globaldeclarations globaldeclaration
                        ;

globaldeclaration       : variabledeclaration
                        | functiondeclaration
                        | mainfunctiondeclaration
                        ;

variabledeclaration     : type identifier ';'
                        ;

identifier              : ID
                        ;

functiondeclaration     : functionheader block
                        ;

functionheader          : type functiondeclarator
                        | VOID functiondeclarator
                        ;

functiondeclarator      : identifier '(' formalparameterlist ')'
                        | identifier '(' ')'
                        ;

formalparameterlist     : formalparameter
                        | formalparameterlist ',' formalparameter
                        ;

formalparameter         : type identifier
                        ;

mainfunctiondeclaration : mainfunctiondeclarator block
                        ;

mainfunctiondeclarator  : identifier '(' ')'
                        ;

block                   : '{' blockstatements '}'
                        | '{' '}'
                        ;

blockstatements         : blockstatement
                        | blockstatements blockstatement
                        ;

blockstatement          : variabledeclaration
                        | statement
                        ;

statement               : block
                        | ';'
                        | statementexpression ';'
                        | BREAK ';'
                        | RETURN expression ';'
                        | RETURN ';'
                        | IF '(' expression ')' statement
                        | IF '(' expression ')' statement ELSE statement
                        | WHILE '(' expression ')' statement
                        ;

statementexpression     : assignment
                        | functioninvocation
                        ;

primary                 : literal
                        | '(' expression ')'
                        | functioninvocation
                        ;

argumentlist            : expression
                        | argumentlist ',' expression
                        ;

functioninvocation      : identifier '(' argumentlist ')'
                        | identifier '(' ')'
                        ;

postfixexpression       : primary
                        | identifier
                        ;

unaryexpression         : '-' unaryexpression
                        | '!' unaryexpression
                        | postfixexpression
                        ;

multiplicativeexpression: unaryexpression
                        | multiplicativeexpression '*' unaryexpression
                        | multiplicativeexpression '/' unaryexpression
                        | multiplicativeexpression '%' unaryexpression
                        ;

additiveexpression      : multiplicativeexpression
                        | additiveexpression '+' multiplicativeexpression
                        | additiveexpression '-' multiplicativeexpression
                        ;

relationalexpression    : additiveexpression
                        | relationalexpression '<' additiveexpression
                        | relationalexpression '>' additiveexpression
                        | relationalexpression LE additiveexpression
                        | relationalexpression GE additiveexpression
                        ;

equalityexpression      : relationalexpression
                        | equalityexpression EQ relationalexpression
                        | equalityexpression NE relationalexpression
                        ;

conditionalandexpression: equalityexpression
                        | conditionalandexpression AND equalityexpression
                        ;

conditionalorexpression : conditionalandexpression
                        | conditionalorexpression OR conditionalandexpression
                        ;

assignmentexpression    : conditionalorexpression
                        | assignment
                        ;

assignment              : identifier '=' assignmentexpression
                        ;

expression              : assignmentexpression
                        ;