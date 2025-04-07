%{
   #include <stdio.h>
   FILE* yyin;
%}

%%
[+-]?[0-1]+            {printf("%s - BINARY\n", yytext);}
[+-]?[0-7]+            {printf("%s - OCTAL\n", yytext);}
[+-]?[0-9]+            {printf("%s - DECIMAL\n", yytext);}
[+-]?[0-9a-fA-F]+      {printf("%s - HEXADECIMAL\n", yytext);}
[ \t\n]                ;
[.]*                      {printf("WRONG\n");}
%%


int main(int argc, char* argv[]) {

   printf("Starting lexer...\n");
   if (argc == 2) {
      yyin = fopen(argv[1], "r");

      if (!yyin) {
         printf("Error opening file!\n");
         fclose(yyin);
         return 0;
      }
   } else {
      printf("Enter token: ");
      yylex();
   }
   yylex();
   fclose(yyin);
   return 1;
}

int yywrap() { return 1; }
