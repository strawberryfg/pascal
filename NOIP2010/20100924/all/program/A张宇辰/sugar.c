#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>


int main(int argc, char *argv[])
{
  int n,count=0,sum,k1,k2,i,j;
  freopen("sugar.in","r",stdin);  
  freopen("sugar.out","w",stdout);
  scanf("%d",&n);
  k1=n/5;
  for(i=0;i<=k1;i++)
  {
    count+=(5*i);
    k2=(n-count)/2;
    for(j=0;j<=k2;j++)
    {
      count+=(2*j);
      if((count<=n) || ((count+5)<=n))  sum++;
      if((count+5)<=n) sum++;
      if(((count+1)<=n)) sum+=2;
      if((count+2)<=n) sum+=2;
      if((count+3)<=n) sum+=2;
      if((count+4)<=n) sum+=2;
      count-=(2*j);
    }
    count=0;
  }
  printf("%d\n",sum);
  return 0;
}
