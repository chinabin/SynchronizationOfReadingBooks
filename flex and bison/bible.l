/*正如Unix的wc程序*/
%{
unsigned long words = 0;
unsigned long lines = 1;
%}
%%
"apple"				{printf("in line: %lu\t%lu\n", lines, words);}
\n					{lines++; words = 0;}
[a-zA-Z]+			{words++;}
.					{}
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
