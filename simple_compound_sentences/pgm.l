%{
   #include <stdio.h>
   #include <stdbool.h>
   bool flag = false;
%}

%%
\n {return 0;}
(and|or|because|but|if|then|nevertheless) {flag = true;}
. ;
%%

int main() {
   printf("Starting lexer...\nEnter tokens: ");
   yylex();

   if (flag) printf("Compound Sentence");
   else printf("Simple Sentence");
}

int yywrap() { return 1; }