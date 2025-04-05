/* Lex Program to recognise and display keywords numbers and words in a given statement */
%{
#include <stdio.h>
%}

keyword auto|break|case|char|const|continue|default|do|double|else|enum|extern|float|for|goto|if|inline|int|long|register|restrict|return|short|signed|sizeof|static|struct|switch|typedef|union|unsigned|void|volatile|while
%%
{keyword} {printf("%s is a keyword", yytext);}

[0-9]+ {printf("%s is a number", yytext);}

[a-zA-Z]+ {printf("%s is a string", yytext);}

.|\n {ECHO;} /* Anything other than the above regex or \n would be matched here, and an ECHO would be outputted, i.e, would give no output */
%%

int main() {
   printf("\nEnter your input: ");
   yylex();
}

int yywrap() {
   return 1;
}


