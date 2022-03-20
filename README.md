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
17. Ensures function foo can be called and defined
18. Ensures hanging if statements are handled correctly
19. Ensures precedence is handled correctly
20. Ensures basic if statement functionality
21. Ensures basic if else statement functionality
22. Ensures multiple subtractions are handled correctly
23. Ensures simple subtraction works
24. Ensures the fibonacci sequence can be parsed correctly

### Semantic Tests
25. Basic main with function call foo
26. No main declaration
27. Multiple main declaration
28. A local declaration was not in an outermost block
29. The number/type of arguments do not match functions declaration
30. The main function can't be called
31. Break statements must be inside a while statement
32. No return statement in a non-void function
33. A void function can't return a value
34. A non-void function must return a value
35. A value returned from a function has the wrong type
36. An identifier is redefined within the same scope
37. An undeclared identifier is used
38. a. Type mismatch || bool bool int
38. b. Type mismatch || bool int bool
39. Type match || bool bool bool
40. a. Type mismatch && bool bool int
40. b. Type mismatch && int bool bool
41. Type match && bool bool bool
42. a. Type mismatch == bool int bool
42. b. Type mismatch == int int int
43. a. Type match == bool bool bool
43. b. Type match == int int bool
44. a. Type mismatch != int bool bool
44. b. Type mismatch != int int int
45. a. Type match != bool bool bool
45. b. Type match != int int bool
46. Type mismatch =
47. Type match =
48. a. Type mismatch < bool int bool
48. b. Type mismatch < int int int
49. Type match < int int bool
50. a. Type mismatch > bool int bool
50. b. Type mismatch > int int int
51. Type match > int int bool
52. a. Type mismatch <= int bool bool
52. b. Type mismatch <= int int int
53. Type match <= int int bool
54. a. Type mismatch >= int bool bool
54. b. Type mismatch >= int int int
55. Type match >= int int bool
56. a. Type mismatch + int int bool
56. b. Type mismatch + int bool int
57. Type match + int int int
58. a. Type mismatch - int bool int
58. b. Type mismatch - int int bool
59. a. Type match - int int int
59. b. Type match - int int
60. a. Type mismatch * int bool int
60. b. Type mismatch * int int bool
61. Type match * int int int
62. a. Type mismatch / int bool int
62. b. Type mismatch / int int bool
63. Type match / int int int
64. a. Type mismatch % int bool int
64. b. Type mismatch % int int bool
65. Type match % int int int
66. a. Type mismatch ! bool int
66. b. Type mismatch ! int bool
67. Type match ! bool bool

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