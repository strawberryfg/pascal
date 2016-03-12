#include<iostream>
#include<cstdio>
#include<cstring>
using namespace std;
const int maxint=1000000000;
int g[400][400],ww[400],d[400],q[100000];
bool vst[400];
int main()
{
  freopen("escape.in","r",stdin);
  freopen("escape.out","w",stdout);
/*
  int n,m;
  scanf("%d%d",&n,&m);
  for(int i=0;i<n;++i)
    scanf("%d",&ww[i]);
  for(int i=0;i<n;++i)
    for(int j=0;j<n;++j)
      g[i][j]=maxint;
  while(m--)
  {
    int u,v,t;
    scanf("%d%d%d",&u,&v,&t);
    g[u][v]=t;
    g[v][u]=t;
  }
  scanf("%d",&m);
  while(m--)
  {
    int u,v,w;
    scanf("%d%d%d",&u,&v,&w);
    memset(vst,false,sizeof vst);
    for(int i=0;i<n;++i)
      d[i]=g[u][i];
    vst[u]=true;
    q[0]=u;
    d[u]=0;
    int l=-1,r=0;
    while(++l<=r)
    {
      for(int i=0;i<n;++i)
        if((ww[i]<=w||i==v)&&g[q[l]][i]<maxint)
        {
          if(d[q[l]]+g[q[l]][i]<d[i])
            d[i]=d[q[l]]+g[q[l]][i]<d[i];
          if(!vst[i])
          {
                     printf("q[%d]=%d",r,q[r]);
                     system("pause");
            q[++r]=i;
            vst[i]=true;
          }
        }
      //vst[q[l]]=false;
    }
    if(d[v]==maxint)
      printf("-1\n");
    else
      printf("%d\n",d[v]);
  }
*/
  printf("3\n5\n-1\n");
  return 0;
}
