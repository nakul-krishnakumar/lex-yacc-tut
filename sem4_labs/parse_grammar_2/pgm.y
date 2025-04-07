%{
   #include <stdio.h>
   void yyerror(char* s);
   int yylex();
%}

%token ID;

%%

S:
   L '=' R
   | R
   ;

L:
   '*' R
   | ID
   ;

R:
   L
   ;

%%

int main() {
   printf("Enter tokens: \n");

   if (yyparse() == 0) printf("Valid\n");
   else printf("Not Valid\n");

}

void yyerror(char* s) {
   fprintf(stderr, "\nError: %s", s);
}