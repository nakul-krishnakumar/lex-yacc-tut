%{
   #include <stdio.h>
   void yyerror(char *);
   #include "y.tab.h"
%}

%%

[a-z]+      {
               yylval = *yytext - 'a';
               return VARIABLE;
            }

[0-9]+      {
               yylval = atoi(yytext);
               return INTEGER;
            }

[-+*/=()\n] {
               return yytext[0];
            }

[ \t]       ;

.           { fprintf(stderr, "%s : invalid character", yytext);}

%%

int yywrap() { return 1; }