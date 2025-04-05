%{
   #include <stdio.h>
   int yylex(void);
   void yyerror(char *);
%}

%token INTEGER

%left '+' '-'
%left '*' '/'

%%

program:
         program expr '\n'     { printf("Answer = %d\n", $2);}
         |
         ;

expr:
      expr '+' expr        { $$ = $1 + $3;}
      | expr '-' expr      { $$ = $1 - $3;}
      | expr '*' expr      { $$ = $1 * $3;}
      | expr '/' expr      { $$ = $1 / $3;}
      | INTEGER            { $$ = $1;}
      ;

%%

void yyerror(char *s) {
   fprintf(stderr, "%s\n", s);
}

int main() {
   yyparse();
   return 0;
}