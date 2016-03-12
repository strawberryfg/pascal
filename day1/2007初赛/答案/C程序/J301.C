#include <stdio.h>
int main()
{int i,p[5],a,b,c,x,y=20;
   for(i=0;i<=4;i++)
     scanf("%d", &p[i]);
   a=(p[0]+p[1])+(p[2]+p[3]+p[4])/7;
   b=p[0]+p[1]/((p[2]+p[3])/p[4]);
   c=p[0]*p[1]/p[2];
   x=a+b-p[(p[3]+3)%4];
   if(x>10)
     y+= (b*100-a)/(p[p[4]%3]*5);
   else
     y+=20+(b*100-c)/(p[p[4]%3]*5);
   printf("%d,%d\n", x,y);
   return 0;
 }


