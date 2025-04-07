%{
   #include <stdio.h>
   int yylex(void);
   void yyerror(char *);
   int sym[26];
%}

%token INTEGER VARIABLE
%left '+' '-'
%left '*' '/'

%%

program:
         program statement '\n'
         |
         ;

statement:
         expr                 { printf("%d\n", $1); }
         | VARIABLE '=' expr  { sym[$1] = $3; }
         ;

expr:
         expr '+' expr        { $$ = $1 + $3;}
         | expr '-' expr      { $$ = $1 - $3;}
         | expr '*' expr      { $$ = $1 * $3;}
         | expr '/' expr      { $$ = $1 / $3;}
         | '(' expr ')'       { $$ = $2;}
         ;

%%

int main() {
   yyparse();
   return 0;
}

void yyerror(char *s) {
   fprintf(stderr, "%s\n", s);
}