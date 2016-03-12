#include<cstdio>
#include<iostream>
#include<cstdlib>
using namespace std;
int n,m,tchr[500],gra[500][500];
bool vis[500];
int dfs(int u,const int v,const int lim,int ti,int te){
    int t=2147483647;
    if(v==u)
        return ti;
    for(int i=0;i<m;++i){
        if(gra[u][i] && lim>=te+tchr[i] && !vis[i]){
            vis[i]=1;
            t=min(dfs(i,v,lim,ti+gra[u][i],te+tchr[i]),t);
            vis[i]=0;
        }
    }
    return 2147483647;
}
int ans(int a,int b,int c){
    return dfs(a,b,c,0,0);
}
int main(){
    freopen("escape.in","r",stdin);
    freopen("escape.out","w",stdout);
    scanf("%d%d",&n,&m);
    for(int i=0;i<n;++i)
        scanf("%d",&tchr[i]);
    int u,v,w,p;
    for(int i=0;i<m;++i){
        scanf("%d%d%d",&u,&v,&w);
        gra[u][v]=w;
        gra[v][u]=w;
    }
    scanf("%d",&p);
    for(int i=0;i<p;++i){
        memset(vis,0,sizeof(vis));
        scanf("%d%d%d",&u,&v,&w);
        printf("%d\n",ans(u,v,w));
    }
    return 0;
}
