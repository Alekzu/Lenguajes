
/*** Definition Section has one variable 
which can be accessed inside yylex()  
and main() ***/
%{ 
int count = 0; 
%} 
predica (p|q|r|t)[[0-9]{0,5}
leer (l|L)(e|E)(e|E)(r|R)
escribir (E|e)(s|S)(c|C)(r|R)(i|I)(b|B)(i|I)(r|R)
  
/*** Rule Section ***/
%% 
[\n\t ]	;
{predica} {printf("%s predicate\n", yytext);}
{predica}([0-9a-zA-Z]) {printf("%s unrecogn\n", yytext);}
(x|y|z)[[0-9]{0,5} {printf("%s variable\n", yytext);}
\( {printf("%s openPar\n", yytext);}
\) {printf("%s closPar\n", yytext);}
\[ {printf("%s openSqrBr\n", yytext);}
\] {printf("%s closSqrBr\n", yytext);}
\!\= {printf("%s notEqual\n", yytext);}
\¬ {printf("%s not\n", yytext);}
\: {printf("%s defineAs\n", yytext);}
(([0-9]+)|([0-9]*\.[0-9]+)([eE][-+]?[0-9]+)?)	{printf("%s numberUnsign\n", yytext);}
\:= {printf("%s asigna\n", yytext);}
(\+|\-|\*|\/) {printf("%s operator\n", yytext);}
(ᐯ|ᐱ|→|⊻) {printf("%s operaLog\n", yytext);}
(<|<=|>|>=|=) {printf("%s comparator\n", yytext);}
\;|\, {printf("%s symbol\n", yytext);}
{leer} {printf("%s read\n", yytext);}
{escribir} {printf("%s write\n", yytext);}
[a-zA-Z] {printf("%s Letra\n", yytext);}
[a-zA-Z]+ {printf("%s Palabra\n", yytext);}
.     {printf("%s no identificado\n", yytext);} 


%% 
  
/*** Code Section p***/
int yywrap(){} 
int main(){ 
  
// Explanation: 
// yywrap() - wraps the above rule section 
/* yyin - takes the file pointer  
          which contains the input*/
/* yylex() - this is the main flex function 
          which runs the Rule Section*/
// yytext is the text in the buffer 
  
// Uncomment the lines below  
// to take input from file 
 FILE *fp; 
 char filename[50]; 
 printf("Enter the filename: \n"); 
 scanf("%s",filename); 
 fp = fopen(filename,"r"); 
 yyin = fp; 
  
yylex(); 
printf("\nNumber of Captial letters " 
      "in the given input - %d\n", count); 
  
return 0; 
} 
