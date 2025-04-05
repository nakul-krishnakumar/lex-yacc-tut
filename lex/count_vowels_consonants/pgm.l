/* Lex program to count the number of consonants and vowels in the input stream */
%{
   #include <stdio.h>
   
   int vowelCount = 0;
   int consonantCount = 0;
%}

%%
\n {return 0;}
[aeiouAEIOU] {vowelCount++;}
[a-zA-Z] {consonantCount++;}
. ;
%%

int main() {
   printf("Starting lexer...\nEnter tokens: ");
   yylex();
   printf("\nNumber of vowels: %d \n", vowelCount);
   printf("Number of consonants: %d \n", consonantCount);
}

int yywrap() { return 1; }