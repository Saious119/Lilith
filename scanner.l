%{
    #include<stdio.h>
    #include<stdlib.h>
    #include<assert.h>
    #include<unistd.h>
    #include<stdbool.h>
    #include "linkedList.h"
    //extern "C" int yylex();

    int lineNum = 1;
    int isPrint = 0; 
    /*0 means the line is a print statement, 
      1 means you;ve printed the first half waiting for end, 
      2 is not a print statement
    */
    int typedefFlag = 0; 
    int classn = 0;
    struct DataItem* ll;
%}

%%
"/*".*"*/" {} //comments 
"//".*"\n" {} //comments 
"Bool" {fputs("bool", yyout);}
"TRUE" {fputs("true", yyout);}
"FALSE" {fputs("false", yyout);}
"U0" {fputs("void", yyout);}
"I0" {fputs("void", yyout);}
"I8" {fputs("char", yyout); isPrint = 2;}
"I16" {fputs("short", yyout);}
"I32" {fputs("int", yyout);}
"I64" {fputs("long", yyout);}
"U64" {fputs("unsigned long", yyout);}
"F64" {fputs("double", yyout);}
"U8" {fputs("unsigned char", yyout); isPrint = 2;}
"=" {
    fputs("=", yyout);
    if(isPrint == 0){
        isPrint = 2;
    }
}
"class" {fputs("typedef struct", yyout);}
"Print" {fputs("printf", yyout);}
"MAlloc" {fputs("malloc", yyout);}
"CAlloc" {fputs("calloc", yyout);}
"Free" {fputs("free", yyout);}
"\"" {
    if(isPrint == 0){
        fputs("printf(\"", yyout);
        //yymore();
        
        //fputs(yytext, yyout);
        //fputs(");", yyout);
        isPrint = 1;
    }
    else if (isPrint != 0) {
        fputs("\"", yyout);
    }
}
";" {
    if(isPrint == 1){
        fputs("", yyout);
    }
    else {
        fputs(";", yyout);
    }
}
"(" {fputs("(", yyout); isPrint = 2;}

[A-Za-z][A-Za-z0-9]* {fputs(yytext, yyout);}
[0-9]+ {fputs(yytext, yyout);}
[ ] {fputs(" ", yyout);}
[\t] {fputs("    ", yyout);}
[\n] { 
    lineNum++;
    if(isPrint == 1){
        //fputs("\"", yyout);
        fputs(");", yyout);
    }
    isPrint = 0;
    fputs("\n", yyout);
}
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
        fprintf(stderr, "Failed to compile out.c \n execvp exited with status: %d \n", status);
        exit(-1);
    }
    fprintf(stderr, "File successfully compiled to a.out \n");
}