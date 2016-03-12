#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#define oo 200000000


int i,n, a[400][400],cost[400],dis[400],mark[400];

int main(int argc, char *argv[])
{
  int v,u,t,m,n,j,min,minj,temp,k,sum,w;
  freopen("escape.in","r",stdin);   
  freopen("escape.out","w",stdout);
  scanf("%d %d",&n,&m);
  for(i=0;i<n;i++)
    for(j=0;j<n;j++)
    {
      if(i==j)  a[i][j]=0;
      else  a[i][j]=oo;
    }
  for(i=0;i<n;i++)
    scanf("%d",&cost[i]);
  for(i=0;i<n;i++)
  {
    scanf("%d %d %d",&u,&v,&t);
    a[u][v]=t;
  }
  scanf("%d",&k);
  for(sum=0;sum<k;sum++)
  {
    
    scanf("%d %d %d",&u,&v,&w);
    for(i=0;i<n;i++) dis[i]=oo,mark[i]=0;
    dis[u]=0;
    minj=u;
    for(i=0;i<n-1;i++)
    {
      min=oo;
      for(j=0;j<n;j++)
        if((!mark[j]) && (dis[j]<min) && ((cost[j]<=w) || (j==u) )) min=dis[j],minj=j;
      mark[minj]=1;
      for(j=0;j<n;j++)
      {
        if((!mark[j]) && (a[minj][j]>0) && ((cost[j]<=w) || (j==v)) )
        {
          temp=a[minj][j]+min;
          if(temp<dis[j]) dis[j]=temp;
        }
      }
    }
    if(dis[v]!=oo)
      printf("%d\n",dis[v]);
    else printf("-1\n");
  }
  return 0;
}
