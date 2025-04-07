%{
   #include <stdio.h>
   #include <stdlib.h>
   #include <string.h>
   FILE* yyin;   

   int validateDate(int d, int m, int y) {
      if (y < 1000 || y > 9999) return 0;
      if (m < 1 || m > 12) return 0;

      int days[] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
      if ((y % 4 == 0 && y % 100 != 0) || (y % 400 == 0)) days[2] = 29;

      return d >= 1 && d <= days[m];
   }
%}

%% 
[0-9]{2}[-:/][0-9]{2}[-:/][0-9]{4}  {
   int d = atoi(yytext);
   int m = atoi(yytext + 3);
   int y = atoi(yytext + 6);

   validateDate(d, m, y) ? printf("%s is a valid date", yytext) : printf("Invalid Date");
}
.  {printf("Invalid Date");}
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
