
/*** Definition Section has one variable 
which can be accessed inside yylex()  
and main() ***/
%{ 
	#include<stdio.h> 
  	#include "y.tab.h" 
  	int yylval; 
%} 
  
/*** Rule Section ***/
%% 
[a-z]{1}    { 
                  yylval=atoi(yytext);
                  return PROPOSITION;
            }
(0|1){1}          {yylval=atoi(yytext);return NUM;}
(\&|~|W|X|F|T)    {return yytext[0];}
\(|\)             {return yytext[0];}
\|                {return yytext[0];}
[a-z]{2,}         {return 0;}
(0|1){2,}         {return 0;}
[\n\t ]	      {return 0;}
.                 {return 0;}


%% 
  
/*** Code Section p***/
 
// Explanation: 
// yywrap() - wraps the above rule section 
/* yyin - takes the file pointer  
          which contains the input*/
/* yylex() - this is the main flex function 
          which runs the Rule Section*/
// yytext is the text in the buffer 

int yywrap() 
{ 
 return 1; 
} 

 
