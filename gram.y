%{
#include <stdio.h>
#include <string.h>
#include "ourivesaria.h"
int yylex();
void yyerror(char *);
int line;
// Variaveis temporarias
char *ref, *nome, *tipo, *data1, *fabricante, *preco, *peso, *material, *numero1, *pedra;
pJoias listaJ = NULL; pObj listaO = NULL; pRel listaR = NULL;
%}

%token RELOGIOS PULSO MESA PAREDE PAREDECOMPE
%token OBJECTOS JARRA TACA MOLDURA CIGARREIRA CANDELABRO FAQUEIRO
%token JOIAS ANEL BRINCOS COLAR ALFINETE OURO PRATA LISA RUBI AMETISTA TOPAZIO ESMERALDA 
%token PONTO VIRG PVIRG PARD PARE 

%union{ char *text; char *date; char *num; }

%token <text>texto
%token <date>data
%token <num>numero

%%

odume : lista 		 { writeHtml(listaJ,listaO,listaR); }
	  ;

lista : JOIAS PARE lJ PARD PVIRG OBJECTOS PARE lOP PARD PVIRG RELOGIOS PARE lR PARD PONTO
	  ;

lJ : joia            { listaJ=addJoias(listaJ, ref, nome, tipo, data1, fabricante, preco, peso, material, numero1, pedra); }
   | lJ VIRG joia    { listaJ=addJoias(listaJ, ref, nome, tipo, data1, fabricante, preco, peso, material, numero1, pedra); }
   ;

lOP : objP           { listaO=addObj(listaO, ref, nome, tipo, data1, fabricante, preco, peso); }
    | lOP VIRG objP  { listaO=addObj(listaO, ref, nome, tipo, data1, fabricante, preco, peso); }
    ;

lR : relo            { listaR=addRel(listaR, ref, nome, tipo, data1, fabricante, preco, peso); }
   | lR VIRG relo    { listaR=addRel(listaR, ref, nome, tipo, data1, fabricante, preco, peso); }
   ;

joia : ANEL desc descj      { tipo = strdup("anel");		  }
     | BRINCOS desc descj   { tipo = strdup("brincos");	  	  }
     | COLAR desc descj     { tipo = strdup("colar");		  }
     | ALFINETE desc descj  { tipo = strdup("alfinete");	  }
     ;

objP : JARRA desc 			{ tipo = strdup("jarra");		  }
     | TACA desc 			{ tipo = strdup("taça"); 		  }
     | MOLDURA desc 		{ tipo = strdup("moldura");       }
     | CIGARREIRA desc 		{ tipo = strdup("cigarreira");    }
     | CANDELABRO desc 		{ tipo = strdup("candelabro");	  }
     | FAQUEIRO desc 		{ tipo = strdup("faqueiro");	  }
     ;

relo : PULSO desc 			{ tipo = strdup("pulso"); 		  }
     | MESA desc 			{ tipo = strdup("mesa"); 		  }
     | PAREDE desc 			{ tipo = strdup("parede"); 		  }
     | PAREDECOMPE desc 	{ tipo = strdup("parede com pé"); }
	 ;

desc 		: 	referencia nome data fabricante preco peso { data1 = strdup($3); }
			;

preco 		: 	numero 		{ preco = strdup($1); 			}
			;

referencia  : 	texto 		{ ref = strdup($1); 			}
		    ;

nome 		: 	texto 		{ nome = strdup($1); 			}
			;

fabricante  : 	texto 		{ fabricante = strdup($1); 	    }
	        ;

peso        :	numero 		{ peso = strdup($1); 		    }
            ;

descj       :   material pedra numeroP
			;

numeroP 	: 	numero 		{ numero1 = strdup($1); 	    }
			;

material  	: 	OURO 		{ material = strdup("ouro");    }
		    | 	PRATA 		{ material = strdup("prata");   }
		    ;

pedra 	    :	LISA 		{ pedra = strdup("lisa"); 	    }
			|	RUBI 		{ pedra = strdup("rubi");       }
			|	AMETISTA 	{ pedra = strdup("ametista");   }
			|	TOPAZIO 	{ pedra = strdup("topazio");    }
			|	ESMERALDA 	{ pedra = strdup("esmeralda");  }
			;

%%

void yyerror(char *s) { 
    fprintf(stderr, "ERRO: %s LINHA %d\n", s, line);
}

int main() {
    yyparse();
    return 0;
}
