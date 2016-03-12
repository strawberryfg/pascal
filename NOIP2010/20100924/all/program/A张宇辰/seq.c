#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#define oo 200000000

int a[200000],cha,min,flag=0,i,n;
int main(int argc, char *argv[])
{
  freopen("seq.in","r",stdin);
  freopen("seq.out","w",stdout);
  scanf("%d",&n);
  for(i=0;i<n;i++)
    scanf("%d",&a[i]);
  min=oo;
  for(i=1;i<n;i++)
  {
    cha=a[i]-a[i-1];
    if(cha<min)  min=cha;
  }
  printf("%d\n",min+1);

  return 0;
}
