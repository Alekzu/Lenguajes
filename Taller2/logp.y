
%{ 
   /* Definition section */
  #include<stdio.h> 
  int flag=0;
  int yylex();
  void yyerror(); 
%} 
  
%token PROPOSITION NUM

%left '(' ')'
%left '&' 'X' '|'
%right '~'
  
/* Rule Section */
%% 
  
LogicProp: E{ 
  
         printf("\nResult=%d\n", $$); 
  
         return 0; 
  
        }; 

E :'('E')'     {$$=$2;}
  | E'W'E   {$$=(!$1 || $3) && (!$3 || $1);}
  | E'X'E   {$$= !$1 || $3;}
  | E'|'E   {$$= $1 || $3;}
  | E'&'E   {$$= $1 && $3;}
  | '~'E       {$$= !$2;}
  | 'F'        {$$= 0;}
  | 'T'        {$$= 1;} 
  
  | PROPOSITION {$$=$1;} 
  | NUM        {$$=$1;}
  
 ; 
  
%% 
  
//driver code 
void main() 
{ 
   printf("\nEnter Logical proposition, propositions with 0/1 will be evaluated:\n"); 
  
   yyparse(); 
   if(flag==0) 
   printf("\nEntered logical proposition is Valid\n\n"); 
} 
  
void yyerror() 
{ 
   printf("\nEntered logical proposition is Invalid\n\n"); 
   flag=1; 
} 