#include "ourivesaria.h"
#include <stdio.h>
#include <stdlib.h>

pJoias addJoias(pJoias j, char *ref,char *nome,char *tipo,char *data,char *fabricante,char *preco,char *peso,char *material,char *numero,char *pedra){
    pJoias aux=NULL; 
    
    aux= (pJoias) malloc(sizeof(Joias));
    aux->ref =ref;
    aux->nome =nome;
    aux->tipo =tipo;
    aux->data =data;
    aux->fabricante =fabricante;
    aux->preco =preco;
    aux->peso =peso;
    aux->material =material;
    aux->pedra =pedra;
    aux->numP =numero;
    aux->next =j;
    
    return aux;
}

pObj addObj(pObj o, char *ref,char *nome,char *tipo,char *data,char *fabricante,char *preco,char *peso){
    pObj aux=NULL;
    
    aux= (pObj) malloc(sizeof(Obj));
    aux->ref =ref;
    aux->nome =nome;
    aux->tipo =tipo;
    aux->data =data;
    aux->fabricante =fabricante;
    aux->preco =preco;
    aux->peso =peso;
    aux->next =o;
    
    return aux;
}

pRel addRel(pRel r, char *ref,char *nome,char *tipo,char *data,char *fabricante,char *preco,char *peso){
    pRel aux=NULL;
    
     aux= (pRel) malloc(sizeof(Rel));
     aux->ref =ref;
     aux->nome =nome;
     aux->tipo =tipo;
     aux->data =data;
     aux->fabricante =fabricante;
     aux->preco =preco;
     aux->peso =peso;
     aux->next =r;
        
     return aux;
  
}

void writeHtml(pJoias j, pObj o, pRel r){
    char *home="homepage.html";
    char *pagJoias="joias.html";
    char *pagObj="obj.html";
    char *pagRel="relogios.html";
    
    

    pJoias auxJ =j;
    pObj auxO =o;
    pRel auxR =r;
    FILE *f;
    int i;
    
    //HomePage
    f=fopen(home,"w+");    
    fprintf(f,"<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"pt-br\" xml:lang=\"pt-br\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" /></head><body><h1 style=\"font-family:verdana;\">ODume</h1><h4>Catalogo de produtos:</h4><div id=\"dvj\">Joias</div><a href=\"joias.html\"><p><img src=\"joia.jpg\"</p></a><div id=\"dvp\">Pratas</div><a href=\"obj.html\"><p><img src=\"prata.jpg\"</p></a><div id=\"dvr\">Relógios</div><a href=\"relogios.html\"><p><img src=\"rel.jpg\"</p></a></body></html>");
    fclose(f);
    
    //Joias
    
    f=fopen(pagJoias,"w+");
    
    fprintf(f,"<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"pt-br\" xml:lang=\"pt-br\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" /></head><body><h1 style=\"text-align:center;\"> Jóias </h1>");
        //Colocar lista
        i=0;
        while(auxJ!=NULL){
            fprintf(f,"<a href=\"#%d\">%s.</a> ",i,auxJ->nome);
            auxJ =auxJ->next;
            i++;
        }
        //Colocar os elementos
        i=0;
        auxJ=j;
        fprintf(f,"<h4> Lista de Jóias:</h4>");
        while(auxJ!=NULL){
            fprintf(f,"<p><a name=\"%d\"><b>%s</b></p><p>Referência:%s - Tipo:%s - Data de entrada: %s - Fabricante: %s - Preço de base: %s€ - Peso:%sg - Material:%s - Pedra Preciosa:%s - Quantidade de pedras:%s.</p><hr />",i,auxJ->nome,auxJ->ref,auxJ->tipo,auxJ->data,auxJ->fabricante,auxJ->preco,auxJ->peso,auxJ->material,auxJ->pedra,auxJ->numP);
            auxJ =auxJ->next;
            i++;
        }
        fprintf(f,"<a href=\"homepage.html\"><p> Home </p></a>");
        fclose(f);
        
        //Objectos
        f=fopen(pagObj,"w+");
        
        fprintf(f,"<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"pt-br\" xml:lang=\"pt-br\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" /></head><body><h1 style=\"text-align:center;\"> Objectos de prata </h1>");
        //Colocar lista
        i=0;
        while(auxO!=NULL){
            fprintf(f,"<a href=\"#%d\">%s.</a> ",i,auxO->nome);
            auxO =auxO->next;
            i++;
        }
        //Colocar elementos
        i=0;
        auxO=o;
        fprintf(f,"<h4> Lista de Objectos:</h4>");
        while(auxO!=NULL){
            fprintf(f,"<p><a name=\"%d\"><b>%s</b></p><p>Referência:%s - Tipo:%s - Data de entrada: %s - Fabricante: %s - Preço de base: %s€ - Peso:%sg.</p><hr />",i,auxO->nome,auxO->ref,auxO->tipo,auxO->data,auxO->fabricante,auxO->preco,auxO->peso);
            auxO=auxO->next;
            i++;
        }
        fprintf(f,"<a href=\"homepage.html\"><p> Home </p></a>");
        fclose(f);
        
                //Relogios
        f=fopen(pagRel,"w+");
        
        fprintf(f,"<html xmlns=\"http://www.w3.org/1999/xhtml\" lang=\"pt-br\" xml:lang=\"pt-br\"><head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" /><link rel=\"stylesheet\" type=\"text/css\" href=\"style.css\" /></head><body><h1 style=\"text-align:center;\"> Relógios </h1>");
        //Colocar lista
        i=0;
        fprintf(f,"<h4> Lista de Relógios:</h4>");
        while(auxR!=NULL){
            fprintf(f,"<a href=\"#%d\">%s.</a> ",i,auxR->nome);
            auxR =auxR->next;
            i++;
        }
        i=0;
        auxR=r;
        while(auxR!=NULL){
            fprintf(f,"<p><a name=\"%d\"><b>%s</b></p><p>Referência:%s - Tipo:%s - Data de entrada: %s - Fabricante: %s - Preço de base: %s€ - Peso:%sg.</p><hr />",i,auxR->nome,auxR->ref,auxR->tipo,auxR->data,auxR->fabricante,auxR->preco,auxR->peso);
            auxR =auxR->next;
            i++;
        }
        fprintf(f,"<a href=\"homepage.html\"><p> Home </p></a>");
        fclose(f);      
}
