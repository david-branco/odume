%{
#include <stdlib.h>
#include "y.tab.h"
void yyerror(char *);
int line = 1;
%}

joias						[Jj][Oo][Ii][Aa][Ss]
objectosDePrata				[Oo][Bb][Jj][Ee][Cc][Tt][Oo][Ss][ ][Dd][Ee][ ][Pp][Rr][Aa][Tt][Aa]
relogios					[Rr][Ee][Ll][Oo][Gg][Ii][Oo][Ss]
anel						[Aa][Nn][Ee][Ll]
brincos						[Bb][Rr][Ii][Nn][Cc][Oo][Ss]
colar						[Cc][Oo][Ll][Aa][Rr]
alfinete					[Aa][Ll][Ff][Ii][Nn][Ee][Tt][Ee]
jarra						[Jj][Aa][Rr][Rr][Aa]	
taca						[Tt][Aa][Cc][Aa]
moldura						[Mm][Oo][Ll][Dd][Uu][Rr][Aa]
cigarreira					[Cc][Ii][Gg][Aa][Rr][Rr][Ee][Ii][Rr][Aa]
candelabro					[Cc][Aa][Nn][Dd][Ee][Ll][Aa][Bb][Rr][Oo]
faqueiro					[Ff][Aa][Qq][Uu][Ee][Ii][Rr][Oo]
pulso						[Pp][Uu][Ll][Ss][Oo]
mesa						[Mm][Ee][Ss][Aa]
parede						[Pp][Aa][Rr][Ee][Dd][Ee]
paredeComPe					[Pp][Aa][Rr][Ee][Dd][Ee][ ][Cc][Oo][Mm][ ][Pp][Ee]
ouro						[Oo][Uu][Rr][Oo]
prata						[Pp][Rr][Aa][Tt][Aa]
lisa						[Ll][Ii][Ss][Aa]
rubi						[Rr][Uu][Bb][Ii]
ametista					[Aa][Mm][Ee][Tt][Ii][Ss][Tt][Aa]
topazio						[Tt][Oo][Pp][Aa][Zz][Ii][Oo]
esmeralda					[Ee][Ss][Mm][Ee][Rr][Aa][Ll][Dd][Aa]	

%%
{joias}							{ return (JOIAS);		}				
{objectosDePrata}				{ return (OBJECTOS); 	}	
{relogios}						{ return (RELOGIOS); 	}
{anel}							{ return (ANEL); 		}
{brincos}						{ return (BRINCOS); 	}	
{colar}							{ return (COLAR); 		}
{alfinete}						{ return (ALFINETE); 	}
{jarra}							{ return (JARRA); 		}
{taca}							{ return (TACA); 		}
{moldura}						{ return (MOLDURA); 	}
{cigarreira}					{ return (CIGARREIRA); 	}	
{candelabro}					{ return (CANDELABRO); 	}	
{faqueiro}						{ return (FAQUEIRO); 	}
{pulso}							{ return (PULSO);		}
{mesa}							{ return (MESA); 		}
{parede}						{ return (PAREDE); 		}	
{paredeComPe}					{ return (PAREDECOMPE); }	
{ouro}							{ return (OURO); 		}
{prata}							{ return (PRATA); 		}
{lisa}							{ return (LISA); 		}
{rubi}							{ return (RUBI);		}
{ametista}						{ return (AMETISTA); 	}
{topazio}						{ return (TOPAZIO); 	}	
{esmeralda}						{ return (ESMERALDA); 	}
"." 							{ return (PONTO);		}
"," 							{ return (VIRG);		}
";" 							{ return (PVIRG);		}
")" 							{ return (PARD);		}
"(" 							{ return (PARE);		}
[0-9]+[.]?[0-9]*           	    { yylval.num = strdup(yytext); return (numero); }
[0-9]{2}"-"[0-9]{2}"-"[0-9]{4}  { yylval.date = strdup(yytext); return (data);  }
[a-zA-Z][a-zA-Z0-9]*    	    { yylval.text = strdup(yytext); return (texto); }
[ \t] 							{ ; }
\n  							{ line++; }
. 								{ printf("Carácter Desconhecido: Linha: %d Erro: %s\n",++yylineno,yytext); }

%%

int  yywrap() { return 1; }
