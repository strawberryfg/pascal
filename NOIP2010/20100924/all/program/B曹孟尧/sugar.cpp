#include<stdio.h>
#include<stdlib.h>

int s=0,n,a=0,b=0;

void tang(int l)
{
     if (l>n) s++;
     else{
          tang(l+1);
          if (a==0) {a=1;tang(l+1);}
          if (b<4) {b++;tang(l+1);}
          if (n-l>=5) tang(l+5);
          if (n-l>=2) tang(l+2);
     }
}

main()
{
      freopen("sugar.in","r",stdin);
      freopen("sugar.out","w",stdout);
      scanf("%d",&n);
      tang(1);
      printf("%d\n",s);
}
