#define MAX_PEDRAS 20

typedef struct sJoias{
    char *ref;
    char *nome;
    char *tipo;
    char *data;
    char *fabricante;
    char *preco;
    char *peso;
    char *material;
    char *pedra;
    char *numP;
    struct sJoias *next;
}*pJoias,Joias;

typedef struct sObjectos{
    char *ref;
    char *nome;
    char *tipo;
    char *data;
    char *fabricante;
    char *preco;
    char *peso;
    struct sObjectos *next;
}*pObj,Obj;

typedef struct sRelogios{
    char *ref;
    char *nome;
    char *tipo;
    char *data;
    char *fabricante;
    char *preco;
    char *peso;
    struct sRelogios *next;
}*pRel,Rel;

pJoias addJoias(pJoias j, char *ref,char *nome,char *tipo,char *data,char *fabricante,char *preco,char *peso,char *material,char *numero,char *pedra);
pObj addObj(pObj o, char *ref,char *nome,char *tipo,char *data,char *fabricante,char *preco,char *peso);
pRel addRel(pRel r, char *ref,char *nome,char *tipo,char *data,char *fabricante,char *preco,char *peso);
void writeHtml(pJoias j, pObj o, pRel r);

