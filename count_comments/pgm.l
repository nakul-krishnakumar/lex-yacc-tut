%{
   #include <stdio.h>
   FILE *yyin;
   int cc = 0;
%}

%%
"/*"(.|\n)*"*/" {cc++;}
"//".* {cc++;}
%%

int main(int argc, char* argv[]) {
   // argc -> number of params
   // argv -> list of params
   printf("Starting lexer...\n");

   if (argc == 2) {
      // argv[0] would be './output' or whatever the output file name is
      // output file is the one that we get after gcc lex.yy.c
      yyin = fopen(argv[1], "r");

      if (!yyin) {
         perror("Error opening file!");
         fclose(yyin);
         return 1;
      }

   } else {
      printf("Enter tokens: \n");
      yyin = stdin;
   }
   yylex();
   printf("Number of comments: %d", cc);

   fclose(yyin);
}

int yywrap() { return 1; }