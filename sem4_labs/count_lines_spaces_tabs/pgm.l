%{
   #include <stdio.h>
   FILE* yyin;
   int lc = 0, sc = 0, tc = 0, oc = 0;
%}

%%
[\n]  { lc++; }
[ ]   { sc++; }
[\t]  { tc++; }
.     { oc++; }
%%

int main(int argc, char* argv[]) {

   printf("Starting lexer...\n");
   if (argc == 2) {
      yyin = fopen(argv[1], "r");

      if (!yyin) {
         printf("Error opening file!\n");
         fclose(yyin);
      }
   } else {
      printf("Enter token: ");
      yylex();
   }
   yylex();
   
   printf("Line count: %d\n", lc);
   printf("Space count: %d\n", sc);
   printf("Tab count: %d\n", tc);
   printf("Other char count: %d\n", oc);
   fclose(yyin);
}

int yywrap() { return 1; }
