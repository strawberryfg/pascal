#include <iostream.h>
#include "ctype.h"
void expand(char s1[],char s2[])
{ int i,j,a,b,c;
  j=0;
  for(i=0;(c=s1[i])!='\0';i++)
    if(c=='-')
      { a=s1[i-1]; b=s1[i+1];
       if ( isalpha(a)&&isalpha(b) || isdigit(a)&&isdigit(b) )
	      { j--;
	       do  s2[j++]=a++;
	       while(tolower(a)<tolower(s1[i+1]));}
        else s2[j++]=c;}
     else s2[j++]=c;
  s2[j]='\0';
 }
void main()
 { char s1[100],s2[300];
   cin>>s1;
   expand(s1,s2);
   cout<<s2<<endl;
 }
