%{
   #include <stdio.h>
   FILE* yyin;
%}

%%
[0-9]+      {printf("%s is a number!\n", yytext);}
.           ;
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