%{
#include "parse.tab.h"
#include <stdio.h>
#define YY_SKIP_YYWRAP
%}
	extern YYSTYPE yylval;
	extern int yywrap() {return 1;};
	extern int isatty();
%%

"T"       { yylval = 1; return boolean; }
"F"       { yylval = 0; return boolean; }
"~T"      { yylval = 0; return boolean; }
"~F"      { yylval = 1; return boolean; }

"("        return *yytext;
 ")"       return *yytext;
[~|&^\n]   return *yytext;
[\t]       ; //whitespace, doesn't ignore spaces just tabs

.          yyerror(); //anything else, print unmatched token

%%
