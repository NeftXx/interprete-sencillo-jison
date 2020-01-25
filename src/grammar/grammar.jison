/**
  * Name: Parser
  * Author: Ronald Berdúo
  */
%start CompilationUnit

%% /* language grammar */
/*
============================================================
  PROGRAM
============================================================
*/
CompilationUnit
  : Block
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
  : STRING_LITERAL
  | NUMBER_LITERAL
  | BOOLEAN_LITERAL
;
