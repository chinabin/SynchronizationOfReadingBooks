/*正如Unix的wc程序*/
%{
#include <string.h>
int chars = 0;
int words = 0;
int lines = 0;
%}
%%
[a-zA-Z]+			{words++; chars += strlen(yytext);}
\n					{chars++; lines++;}
.					{chars++;}
%%

int main(int argc, char **argv)
{
	yylex();	// flex提供的词法分析例程yylex()
    printf("%8d%8d%8d", lines, words, chars);
    return 0;
}

int yywrap()  
{  
    return 1;  
} 
