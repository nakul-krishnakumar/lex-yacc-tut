%{
   #include <stdio.h>
   void yyerror(char* s);
   int yylex();
%}

%token ID;
%token TYPE;

%%
D:
   T L
   ;

T:
   TYPE
   ;

L:
   L ',' ID
   | ID
   ;
%%

int main() {
   printf("Enter tokens: \n");
   if (yyparse() == 0) {
      printf("Valid");
   }
}

void yyerror(char* s) {
   fprintf(stderr, "Not valid");
}