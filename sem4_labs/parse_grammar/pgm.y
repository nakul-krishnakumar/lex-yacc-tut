%{
   #include <stdio.h>
   void yyerror();
   int yylex();
%}

%token ID

%%
expr : 
      expr expr '*'     
      | expr expr '+'   
      | ID              
      ;
%%

int main() {
   if (yyparse() == 0) printf("Accepted");
   else printf("Wrong");
   return 0;
}

void yyerror(char *s) {
   fprintf(stderr, "Error: %s\n", s);
}