%{
   #include <stdio.h>
   void yyerror(char* s);
   int yylex();
%}

%token ID;
%left '+' '-'

%%
problem:
         expr                 {printf("%d\n", $1);}
         ;
expr:
         expr '+' expr        {$$ = $1 + $3;}
         | expr '-' expr      {$$ = $1 - $3;}
         | ID                 {$$ = $1;}
         ;
%%

int main() {
   yyparse();
   return 0;
}

void yyerror(char* s) {
   fprintf(stderr, "Error: %s", s);
}