%{
   #include "y.tab.h"
%}

%%
a   {return ID;}
[ \t\n] {return 0;}
[*+]     {return yytext[0];}
%%

int yywrap() { return 1; }