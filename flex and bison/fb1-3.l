/*正如Unix的wc程序*/
%{
%}
%%
"+"			{printf("PLUS\n");}
"-"			{printf("MINUS\n");}
"*"			{printf("TIMES\n");}
"/"			{printf("DIVIDE\n");}
"|"			{printf("ABS\n");}
[0-9]+		{printf("NUMBER: %s\n", yytext);}
\n			{printf("NEWLINE\n");}
[ \t]		{}
.			{printf("Mystery character %s\n", yytext);}
%%

int main(int argc, char **argv)
{
	yylex();	// flex提供的词法分析例程yylex()
    return 0;
}

int yywrap()  
{  
    return 1;  
} 
