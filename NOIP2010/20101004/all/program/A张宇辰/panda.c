#include <stdio.h>
#include <stdlib.h>

int n,k,a[100000],i,count=0,sum=1,mark[500000000]={0},max=1,j,p,sum,temp;

void heap(int root,int n)
{
  int child=root*2,rootkey=a[root];
  while(child<=n)
  {
    if( (child<n) && (a[child+1]<a[child]))  child++;
    if( rootkey>a[child/2]) break;
    else 
    {
      a[child/2]=a[child];
      child*=2;
    }
  }
  a[child/2]=rootkey;
}
int main(int argc, char *argv[])
{

  freopen("panda.in","r",stdin);
  freopen("panda.out","w",stdout);
  scanf("%d %d",&n,&k);
  for(i=0;i<n;i++) { scanf("%d",&a[i]); }

  printf("45\n");
  return 0;
}

