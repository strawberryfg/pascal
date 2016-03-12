#include "stdio.h"
char ch[]={'q','A','S','O','R','T','E','X','A','M','P','L','E'};
int n=12;
void shift(int k, int n)
 {char v;
  int j;
  v=ch[k]; j=k+k;
  while (j<=n)
    {if((j<n) && (ch[j]<ch[j+1])) j++;
     if (v<ch[j])
       { ch[j/2]=ch[j]; j*=2; }
     else
       return;
     ch[j/2]=v;
    }
 }
void hpsrt(void)
 {int k;
 char tmp;
 for (k=n/2; k>0; k--)  shift(k,n);
 printf("No.1: ");
 for(k=1; k<=n; k++)  putchar(ch[k]);
 putchar('\n');
 for (k=n; k>0; k--)
   { tmp=ch[1]; ch[1]=ch[k]; ch[k]=tmp;
     shift(1,k-1);
    }
 }
main()
{int k;
 hpsrt();
 printf("No.2: ");
 for(k=1; k<=n; k++)  putchar(ch[k]);
 putchar('\n');
}





