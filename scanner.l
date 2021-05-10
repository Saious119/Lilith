%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<assert.h>
    #include "scanner.tab.h"
    //extern "C" int yylex();

    int lineNum = 1;
%}

%%
"//".*"//" {} //comments 
"//".*"//" {} //comments 
"Bool" {return BOOL;}
"U0" {return VOID;}
"I0" {return VOID;}
"I8" {return BYTE;}
"I16" {return SHORT;}
"I32" {return INT;}
"I64" {return LONG;}
"U8" {return CHAR;}

[A-Za-z][A-Za-z0-9]* {yylval.sval = strdup(yytext); return ID;}
[0-9]+ {yylval.ival = atoi(yytext); return INUM;}
[0-9]+\.[0-9]+ {yylval.fval = atof(yytext); return RNUM;}
[ \t] {}
[\n] {lineNum++;}
. {fprintf(stderr, "Unknown Token: %s", yytext);}

%%

int yyerror(char* msg){
    fprintf(stderr, "ERROR on LINE: %d: %s \n", lineNum, msg);
    exit(2);
}