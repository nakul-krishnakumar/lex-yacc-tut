%{
   #include <stdio.h>
   FILE* yyin;
%}

%%
[a-zA-Z]+     {printf("%s is a string\n", yytext);}
.             ;
%%

int main(int argc, char* argv[]) {
   printf("Starting lexer...\n");
   if (argc == 2) {
      yyin = fopen(argv[1], "r");
   } else {
      printf("Enter tokens: \n");
      yylex();
   }

   return 1;
}

int yywrap() { return 1; }