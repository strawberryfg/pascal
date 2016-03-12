/*±àĞ´º¯Êıreverse( s)£¬Çó×Ö·û´®sµÄÄæĞò¡£*/
#include "stdio.h"
#include "string.h"
int maxline=200;
int getline(char s[],int lim)
{int c,i;
 for(i=0; i<lim-1 && (c=getchar())!=EOF && c!='\n';++i)
   s[i]=c;
 if(c=='\n')
   {s[i]=c; ++i;}
 s[i]='\0';
 return i;
 }
int reverse(char s[])
 {int i,j,t;
  for(i=0,j=strlen(s)-2; i<j; i++,j--)
   {t=s[i]; s[i]=s[j]; s[j]=t;}
  return 0;
 }
main()
{ char line[100];
  while((getline(line,maxline))>0)
    { printf("%s",line);
      reverse(line);   printf("%s",line);
    }
}


