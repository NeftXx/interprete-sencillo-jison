/**
  * Name: Lexer
  * Author: Ronald Berdúo
  */
EndOfLine             \r|\n|\r\n
Spaces                \r|\n|\r\n|[ \t\f]
Identifier            [_]*[a-zA-Z][a-zA-Z0-9_]*
NumberLiteral         [0-9]+("."[0-9]+)?
BooleanLiteral        true|false

%x END_OF_LINE_COMMENT
%x TRADITIONAL_COMMENT
%x STRING

%%
/* Blanks */
{Spaces}                          { /* Ignore blank spaces */ }

/* Comments */
"/*"                              { this.pushState("TRADITIONAL_COMMENT"); }
<TRADITIONAL_COMMENT>"*/"         { this.popState(); }
<TRADITIONAL_COMMENT><<EOF>>      { this.popState(); }
<TRADITIONAL_COMMENT>[^]          { /* Ignore anything */ }
"//"                              { this.pushState("END_OF_LINE_COMMENT"); }
<END_OF_LINE_COMMENT>{EndOfLine}  { this.popState(); }
<END_OF_LINE_COMMENT>.            { /* Ignore */ }

/* Keywords */
"number"                          { return "number";  }
"string"                          { return "string";  }
"boolean"                         { return "boolean"; }
"println"                         { return "println"; }
"print"                           { return "print";   }
"while"                           { return "while";   }
"else"                            { return "else";    }
"if"                              { return "if";      }

/* Literals */
{BooleanLiteral}                  { return "BOOLEAN_LITERAL"; }
{NumberLiteral}                   { return "NUMBER_LITERAL"; }
\"                                { stringBuilder.length = 0; this.pushState("STRING"); }
<STRING>\"                        {
                                    this.popState(); yytext = stringBuilder.join("");
                                    return "STRING_LITERAL";
                                  }
<STRING>"\\'"                     { stringBuilder.push("'"); }
<STRING>"\\\""                    { stringBuilder.push("\""); }
<STRING>"\\?"                     { stringBuilder.push("?"); }
<STRING>"\\\\"                    { stringBuilder.push("\\"); }
<STRING>"\\0"                     { stringBuilder.push("\0"); }
<STRING>"\\a"                     { stringBuilder.push(String.fromCharCode(7)); }
<STRING>"\\b"                     { stringBuilder.push("\b"); }
<STRING>"\\f"                     { stringBuilder.push("\f"); }
<STRING>"\\n"                     { stringBuilder.push("\n"); }
<STRING>"\\r"                     { stringBuilder.push("\r"); }
<STRING>"\\t"                     { stringBuilder.push("\t"); }
<STRING>"\\v"                     { stringBuilder.push("\v"); }
<STRING>\\.                       {
                                    this.popState();
                                    return "ILLEGAL_CHARACTER";
                                  }
<STRING>{EndOfLine}               {
                                    this.popState();
                                    return "ILLEGAL_CHARACTER";
                                  }
<STRING>[^\r\n\"\\]+              { stringBuilder.push(yytext); }

/* Names */
{Identifier}                      { return "IDENTIFIER"; }

/* Separators */
"++"                              { return "++"; }
"--"                              { return "--"; }
"!="                              { return "!="; }
"=="                              { return "=="; }
">="                              { return ">="; }
"<="                              { return "<="; }
"&&"                              { return "&&"; }
"||"                              { return "||"; }
"+"                               { return "+"; }
"-"                               { return "-"; }
"*"                               { return "*"; }
"/"                               { return "/"; }
"%"                               { return "%"; }
"="                               { return "="; }
">"                               { return ">"; }
"<"                               { return "<"; }
"?"                               { return "?"; }
":"                               { return ":"; }
"^"                               { return "^"; }
"!"                               { return "!"; }
"("                               { return "("; }
")"                               { return ")"; }
"["                               { return "["; }
"]"                               { return "]"; }
"{"                               { return "{"; }
"}"                               { return "}"; }
","                               { return ","; }
"?"                               { return "?"; }
":"                               { return ":"; }
";"                               { return ";"; }
"."                               { return "."; }
<<EOF>>                           { return "EOF"; }
.                                 { return "ILLEGAL_CHARACTER"; }

%%
let stringBuilder = [];