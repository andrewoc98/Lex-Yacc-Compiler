/* Headers, declarations */
%{
    #include "myscanner.h"
    #include <stdio.h>
%}

/* Token Specification */
%%
(?i:"START;")                                                               return START;
(?i:"MAIN;")                                                                return begin_function;
(?i:"END_NOW;")                                                             return END_NOW;
(?i:"END;")                                                                 return END;
(?i:"PRINT")                                                                return PRINT;
(?i:"ADD")                                                                  return ADD;
(?i:"MINUS")                                                                return MINUS;
(?I:"INPUT")                                                                return INPUT;
[A-Za-z][0-9]?[A-Za-z]*(?i:" EQUALS-TO ")[0-9]+                       return EQUALS_TO_VALUE_integer;
[A-Za-z][0-9]?[A-Za-z]*(?:" EQUALS-TO ")[0-9]+[.][0-9]+               return EQUALS_TO_VALUE_dou;
[Xx]+                                                                       return INT;
[Xx]+[-][Xx]+                                                               return DOUBLE;
[A-Za-z][0-9]?[A-Za-z]*(?i:" EQUALS-TO ")[A-Za-z][0-9]?[A-Za-z]*      return EQUALS_TO,IDENTIFIER;
[A-Za-z]+[0-9]*[A-Za-z]*                                                    return IDENTIFIER;
(-)?[0-9]+                                                                  return INTEGER_LITERAL;
(-)?[0-9]+[.][0-9]+                                                         return DOUBLE_LITERAL;
[;]                                                                         return SEMICOLON;
["].*["]                                                                    return QUOTE;
,                                                                           return COMMA;
[ \t\n]                                                                     ;
.                                                                           printf("unexpected character \n"); return END;

%%

/* C Functions */
int main(){
    yylex();
}
int yywrap() { return 1; }
