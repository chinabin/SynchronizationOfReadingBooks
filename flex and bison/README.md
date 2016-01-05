#### 1. Ch1
----

```
例1-1: 字数统计
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

// On windwos, must have this function
int yywrap()  
{  
    return 1;  
} 

```
----
#####note:
1. flex程序包含三部分，各部分之间通过仅有的%%行来进行分割，第一部分包含声明和选项设置，第二部分是一系列的模式和动作，
第三部分则是会被拷贝到生成的词法分析器里面的C代码，它们通常是一些动作代码相关的例程。
在声明部分，%{和%}之间的代码会被原样抄到生成的C文件的开头部分。
2. 在任意一个flex动作中，变量yytext总是被设为指向背刺匹配的输入文本。

#####run:
```
$ flex fd1-1
$ cc lex.yy.c -lfl
$ ./a.out
```