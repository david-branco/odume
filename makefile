ourivesaria : y.tab.c ourivesaria.o lex.yy.c
	gcc -o ourivesaria y.tab.c lex.yy.c ourivesaria.o
lex.yy.c : gram.l
	flex gram.l 
y.tab.c : gram.l
	yacc -d gram.y 
ourivesaria.o : ourivesaria.c
	gcc -c ourivesaria.c
