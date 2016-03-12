#include <stdio.h>
#include <stdlib.h>

int t1,t2,t3,t4,n,m,j,i,count=0,a[100000];
void work(int b,int s,int t,int d)
{
   int p;
   if(b==2)  for(p=s;p<=t;p++) a[p]+=d;
   else if(b==3)  for(p=s;p<=t;p++)  a[p]=d;
   
   else if(b==1)
   {
     for(p=s;p<=t;p++) { a[p]-=d; }
     for(p=s;p<=t;p++) if(a[p]<=0)  return;
     
   }
   count++;
}
int main(int argc, char *argv[])
{
  freopen("highway.in","r",stdin); 
  freopen("highway.out","w",stdout);
  scanf("%d %d %d",&n,&m,&i);
  for(j=0;j<n;j++)
    a[j]=i;
  for(j=0;j<m;j++)
  {
    scanf("%d %d %d %d",&t1,&t2,&t3,&t4);
    work(t1,t2,t3,t4);
  }
  printf("%d\n",count);
  return 0;
}
