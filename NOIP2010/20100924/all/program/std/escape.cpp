#include <iostream>
#include <cstdio>
#include <cstdlib>
using namespace std;

const int MaxN=333; 
const int MaxQ=111111;
const int INF=1000000000;
int now[MaxN],G[MaxN][MaxN],ans[MaxQ];
struct node
{
    int w,pos;   
}a[MaxN];
struct node2
{
    int u,v,w,pos;   
}Q[MaxQ];



bool cmp(node x, node y)
{
    return x.w<y.w; 
}


bool cmp2(node2 x, node2 y)
{
    return x.w<y.w; 
}


int main()
{
    freopen("escape.in","r",stdin);
    freopen("escape.out","w",stdout);
    
    int N,M,questions;
    scanf("%d %d\n",&N,&M);
    for (int i=0; i<N; ++i) a[i].pos=i;
    for (int i=0; i<N; ++i) scanf("%d",&a[i].w);
    scanf("\n");
    sort(a,a+N,cmp);
    for (int i=0; i<N; ++i) now[a[i].pos]=i;
//    for (int i=0; i<N; ++i) cout<<i<<":"<<a[i].w<<"  "<<a[i].pos<<endl;
    
    memset(G,62,sizeof(G));
    for (int i=1; i<=M; ++i)
    {
        int x,y,z;
        scanf("%d %d %d\n",&x,&y,&z);
        G[now[x]][now[y]]=G[now[y]][now[x]]=z;
    }
//    for (int i=0; i<N; ++i)
//        for (int j=0; j<N; ++j) cout<<i<<" "<<j<<":"<<G[i][j]<<endl;
    
    scanf("%d\n",&questions);
    for (int i=1; i<=questions; ++i) scanf("%d %d %d\n",&Q[i].u,&Q[i].v,&Q[i].w);
    for (int i=1; i<=questions; ++i) Q[i].pos=i;
    sort(Q+1,Q+questions+1,cmp2);
    int point=0;
    for (int i=1; i<=questions; ++i)
    {
        for (;point<N&&a[point].w<=Q[i].w; ++point)
        {
            for (int k1=0; k1<N; ++k1)
                for (int k2=0; k2<N; ++k2)
                    G[k1][k2]=min(G[k1][k2],G[k1][point]+G[point][k2]);
        }
        ans[Q[i].pos]=G[now[Q[i].u]][now[Q[i].v]];
    }
    
    for (int i=1; i<=questions; ++i)
        (ans[i]>INF) ? printf("-1\n") : printf("%d\n",ans[i]);
    return 0;
}
