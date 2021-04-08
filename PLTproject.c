#include <stdio.h>
#include "myscanner.h"

extern int yylex();
extern int yylineno;
extern char* yytext;

char *names[]={"END","START","begin_function","INT","DOUBLE","DASH","EQUALS_TO","EQUALS_TO_VALUE_dou","EQUALS_TO_VALUE_integer","IDENTIFIER"};

int main(void){
    int ntoken,vtoken;

    ntoken = yylex();

    while(ntoken){
        printf("%d\n",ntoken);
        ntoken=yylex();
    }
    return 0;
}