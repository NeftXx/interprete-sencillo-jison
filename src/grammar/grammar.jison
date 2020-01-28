/**
  * Name: Parser
  * Author: Ronald Berdúo
  */
%start CompilationUnit

%options parser-errors-are-recoverable lexer-errors-are-recoverable

%right '='
%right '?' ':'
%left '||'
%left '&&'
%left '^'
%left '!=' '=='
%nonassoc '>=' '>' '<=' '<'
%left '+' '-'
%left '*' '/' '%'
%left '(' ')'

%% /* language grammar */
/*
============================================================
  PROGRAM
============================================================
*/
CompilationUnit
  : Statements EOF
  | error EOF {
    addSemanticError($error.errStr, @error);
    yyerrok;
    yyclearin;
  }
;

Block
  : '{' Statements '}'
;

Statements
  : Statements Statement
  | Statement
;

Statement
  : PrintStatement
  | VariableDeclarationStatement
  | AssignmentStatement
  | IfStatement
  | WhileStatement
  | error ';' {
    addSemanticError($error.errStr, @error);
    yyerrok;
    yyclearin;
  }
;

/*
============================================================
  TYPES
============================================================
*/
Type
  : 'number'
  | 'boolean'
  | 'string'
;

/*
============================================================
  DECLARATION AND ASSIGNMENT STATEMENTS
============================================================
*/
VariableDeclarationStatement
  : Type VariableDeclarators ';'
;

VariableDeclarators
  : VariableDeclarators ',' VariableDeclarator
  | VariableDeclarator
;

VariableDeclarator
  : IDENTIFIER '=' Expression
  | IDENTIFIER
;

AssignmentStatement
  : IDENTIFIER '=' Expression ';'
;

/*
============================================================
  IF STATEMENT
============================================================
*/
IfStatement
  : IfList 'else' Block
  | IfList
;

IfList
  : IfList 'else' 'if' '(' Expression ')' Block
  | 'if' '(' Expression ')' Block
;

/*
============================================================
  WHILE STATEMENT
============================================================
*/
WhileStatement
  : 'while' '(' Expression ')' Block
;

/*
============================================================
  PRINT STATEMENT
============================================================
*/
PrintStatement
  : 'println' '(' Expression ')' ';' {
  }
  | 'print' '(' Expression ')' ';' {

  }
;

/*
============================================================
  EXPRESSIONS
============================================================
*/
Expression
  : STRING_LITERAL {}
  | NUMBER_LITERAL {}
  | BOOLEAN_LITERAL {}
  | IDENTIFIER {}
;

%%
function addSemanticError(message, information) {
  console.log(message, information);
}