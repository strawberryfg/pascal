#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
using namespace std;
const int maxn=100,maxm=10000;
int n,m,ans,i,j,vf1,vf2,father[100];
struct typ 
{
       int a,b,v;
}p[maxn];
bool cmp(typ x,typ y)
{
     return x.v<=y.v;
}
int find(int v)
{
    int t;
    t=v;
    while (father[t]>=0) t=father[t];
    return t;
}
int main()
{
    freopen("kruskal.in","r",stdin);
    freopen("kruskal.out","w",stdout);
    scanf("%d %d",&n,&m);
    for (i=1;i<=m;i++) scanf("%d %d %d",&p[i].a,&p[i].b,&p[i].v);
    sort(p+1,p+m+1,cmp);    
    memset(father,-1,sizeof(father));
    i=1;    j=1;    ans=0;
    while ((i<=maxm)and(j<=n-1))
    {
          vf1=find(p[i].a);
          vf2=find(p[i].b);
          if (vf1!=vf2)
          {
             father[vf2]=vf1;
             j++;
             ans+=p[i].v;
          }
          i++;
    }
    printf("%d\n",ans);
    return 0;
}     
