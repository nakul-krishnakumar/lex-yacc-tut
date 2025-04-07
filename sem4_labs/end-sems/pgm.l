%{
   #include <stdio.h>
   #include <ctype.h>
   #include <string.h>
   #include <stdbool.h>

   bool isValidPass(const char* pass) {
      bool hasNum = false, hasUpper = false, hasLower = false, hasSS = false;

      char ss[] = {'#', '*', '/', '!', '+', '-', '?', '%', '_', '^'};

      for (int i = 0; i < strlen(pass); ++i) {
         if (isdigit(pass[i])) hasNum = true;
         if (isupper(pass[i])) hasUpper = true;
         if (islower(pass[i])) hasLower = true;

         for (int j=0; j<10; ++j) {
            if (pass[i] == ss[j]) {
               hasSS = true;
               break;
            }
         }

      }

      return hasNum && hasUpper && hasLower && hasSS;
   }

%}

%%
[ \t\n]    ;

[-#*/!+?%_^a-zA-Z0-9]{8}[-#*/!+?%_^a-zA-Z0-9]*      {
      isValidPass(yytext) ? printf("Valid Password\n") : printf("Invalid Password\n");
}

.*         { printf("Invalid Password\n"); }
%%

int main() {
   printf("Starting lexer...\nEnter password: \n");
   yylex();
   return 0;
}  

int yywrap() { return 1; }
