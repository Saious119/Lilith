%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<assert.h>
    #include <unistd.h>
    //extern "C" int yylex();

    int lineNum = 1;
%}

%%
"/*".*"*/" {} //comments 
"//".*"\n" {} //comments 
"Bool" {fputs("bool", yyout);}
"U0" {fputs("void", yyout);}
"I0" {fputs("void", yyout);}
"I8" {fputs("char", yyout);}
"I16" {fputs("short", yyout);}
"I32" {fputs("int", yyout);}
"I64" {fputs("long", yyout);}
"U8" {fputs("unsigned char", yyout);}

[A-Za-z][A-Za-z0-9]* {fputs(yytext, yyout);}
[0-9]+ {fputs(yytext, yyout);}
[ ] {fputs(" ", yyout);}
[\t] {fputs("    ", yyout);}
[\n] {fputs("\n", yyout); lineNum++;}
. {fputs(yytext, yyout);}

%%

int yyerror(char* msg){
    fprintf(stderr, "ERROR on LINE: %d: %s \n", lineNum, msg);
    exit(2);
}

int main(){
    extern FILE *yyout; 
    yyout = fopen("out.c", "w+");
    fputs("#include<stdio.h>\n", yyout);
    fputs("#include<stdlib.h>\n", yyout);
    fputs("#include<string.h>\n", yyout);
    fputs("#include<stdbool.h>\n", yyout);
    yylex();
    fclose(yyout);
    fprintf(stderr, "Translation complete, now compiling\n");
    char cmd[10] = "gcc out.c";
    int status = system(cmd);
    if(status != 0){
        fprintf(stderr, "execvp exited with status: %d \n", status);
        exit(-1);
    }
    fprintf(stderr, "File successfully compiled to a.out \n");
}