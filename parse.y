%{
#include <stdlib.h>
#include <stdio.h>

int yylex(void);

void yyerror();

%}

%token boolean

%left '|'

%left '&' '^'

%left '(' ')'

%%

program:
    program expr '\n' { if ($2 == 1) { printf("T\n"); } else { printf("F\n"); } }
  |
  ;

expr:
    boolean { $$ = $1; }
  | expr '&' '&' expr { $$ = $1 * $4; }
  | expr '^' expr { $$ = $1 ^ $3; }
  | expr '|' '|' expr { $$ = $1 + $4; }
  | '(' expr ')' { $$ = $2; }
  ;

%%

void yyerror() {
     printf("unmatched token\n");
}

int main(void) {
    yyparse();
    return 0;
}
