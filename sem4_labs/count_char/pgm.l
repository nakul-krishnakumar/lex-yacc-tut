%{
   #include <stdio.h>
   FILE* yyin;
   int count = 0;
%}

%%
(.|\n)      {count += yyleng;}
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
   printf("\nCharacter count: %d", count);
   fclose(yyin);
   return 1;
}

int yywrap() { return 1; }

