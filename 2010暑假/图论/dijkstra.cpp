#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>

using namespace std;
int dis[1001],hash[1001],link[1001][1001],p[1001][1001];
int main()
{
    freopen("dijkstra.in","r",stdin);
    freopen("dijkstra.out","w",stdout);
    int n,k,s,t,i,tot,res,num,a,b,v,temp;
    scanf("%d %d",&n,&k);
    scanf("%d %d",&s,&t);
    memset(link,0,sizeof(link));
    memset(hash,0,sizeof(hash));
    memset(dis,0,sizeof(dis));
    memset(p,0,sizeof(p));
    for (i=2;i<=n;i++) dis[i]=2147483647;
    for (i=1;i<=k;i++)
    {
        scanf("%d %d %d",&a,&b,&v);
        link[a][b]=v;
        link[b][a]=v;
        p[a][0]++;
        p[a][p[a][0]]=b;        
        p[b][0]++;
        p[b][p[b][0]]=a;
    }    
    tot=1; 
    while (tot!=n)
    {
        res=2147483647; num=0;
        tot++;
        for (i=1;i<=n;i++) {if (hash[i]==1) continue; if (dis[i]<res){res=dis[i];num=i; }}
        hash[num]=1;
        for (i=1;i<=p[num][0];i++)
        {
            temp=p[num][i];
            dis[temp]=min(dis[temp],dis[num]+link[num][temp]);    
        }    
        
    }    
    printf("%d\n",dis[t]);
    return 0;
    }    
