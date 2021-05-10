CC = clang
LEX = flex
FLAGS = -g -c
LIBS = -lfl -ly

lil: scanner.tab.o lex.yy.o 
	$(CC) -g -o lil scanner.tab.o lex.yy.o $(LIBS)

scanner.tab.o: scanner.tab.c
	$(CC) $(FLAGS) scanner.tab.c

scanner.tab.c: scanner.y
	bison -dv scanner.y

lex.yy.o: lex.yy.c 
	$(CC) $(FLAGS) lex.yy.c 

lex.yy.c: scanner.l
	$(LEX) -l scanner.l 

clean:
	rm -f lex.yy.* *.o *.output *.tab.c lil
