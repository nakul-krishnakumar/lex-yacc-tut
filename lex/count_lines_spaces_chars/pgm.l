%{
   #include <stdio.h>

   int lineCount = 0;
   int spaceCount = 0;
   int wordCount = 0;
   int charCount = 0;
%}

%%
[\n] {lineCount++; charCount += yyleng;}
[ \t] {spaceCount++; charCount += yyleng;}
[^\t\n ]+ {wordCount++; charCount += yyleng;}
%%

int main() {
   printf("Starting lexer...\nEnter token: \n");
   yylex();
   printf("\nNumber of Lines: %d\n", lineCount);
   printf("Number of Spaces: %d\n", spaceCount);
   printf("Number of Word: %d\n", wordCount);
   printf("Number of Characters: %d\n", charCount);
}

int yywrap() { return 1; }