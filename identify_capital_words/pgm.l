/* Lex program to identify capital words */
%{
   #include <stdio.h>
%}

%%
[A-Z]+ {printf("%s is a capital word\n", yytext);}
[a-z]+ {printf("%s is a lowercase word\n", yytext);}
[a-zA-Z]+ {printf("%s is a mixedcase word\n", yytext);}
. {printf("%s is something else\n", yytext);}
%%

int main() {
   printf("Starting lexer...\nEnter tokens: ");
   yylex();
   return 0;
}

int yywrap() { return 1;}