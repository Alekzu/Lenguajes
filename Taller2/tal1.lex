
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
[a-z]{1} { 
      yylval=atoi(yytext);
      return PROPOSICION;
      }
[a-z]{2,} return 0;
[\n\t ]	return 0;
. return yytext[0];



%% 
  
/*** Code Section p***/

/* YET TO BE USED
 \;| { yylval=atoi(yytext); return SEMICOLON;}
[a-zA-Z] {printf("%s Letra\n", yytext);}
[a-zA-Z]+ {printf("%s Palabra\n", yytext);}
*/
//int yywrap(){} 
//int main(){ 
  
// Explanation: 
// yywrap() - wraps the above rule section 
/* yyin - takes the file pointer  
          which contains the input*/
/* yylex() - this is the main flex function 
          which runs the Rule Section*/
// yytext is the text in the buffer 
  
// Uncomment the lines below  
// to take input from file 

int yywrap() 
{ 
 return 1; 
} 

 
