%{
   #include <stdio.h>
   #include "y.tab.h"
   FILE* yyin;
%}

%%
"+"      { return '+';}
"-"      { return '-';}
[0-9]+   { yylval = atoi(yytext); return ID;}
.        ;
%%

int yywrap() { return 1; }