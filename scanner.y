%{
#include<stdio.h>
#include<stdlib.h>
#include<assert.h>
#include <string.h>
#include "scanner.tab.h"

extern int yyerror(char*);
extern int yylex();
extern FILE *yyin;

int main(char** argv[]){
    fprintf(stderr, "reading in file");
    FILE *file = fopen(argv[1], "r");
    yyin = file;
    yyparse();
}
%}

%token <string> BOOL VOID BYTE SHORT INT LONG CHAR

