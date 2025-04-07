%{
#include "y.tab.h"
%}

%%

[a-zA-Z]   { return ID; }
"="        { return '='; }
"*"        { return '*'; }
[ \t\n]+   ;         // Ignore whitespace
.          { return yytext[0]; } // Invalid character handling

%%

int yywrap() {
    return 1;
}
