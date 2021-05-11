CC = clang
LEX = flex
FLAGS = -g -c
LIBS = -lfl -ly

lil: lex.yy.o 
	$(CC) -g -o lil lex.yy.o $(LIBS)

lex.yy.o: lex.yy.c 
	$(CC) $(FLAGS) lex.yy.c 

lex.yy.c: scanner.l
	$(LEX) -l scanner.l 

clean:
	rm -f lex.yy.* *.o *.output *.tab.c lil
