%{
   #include <stdio.h>
   #include "y.tab.h"
%}

%%
("int"|"float")   {return TYPE;}
[a-zA-Z]+         {return ID;}
.                 ;
%%

int yywrap() { return 1; }