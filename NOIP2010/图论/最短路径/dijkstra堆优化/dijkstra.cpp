#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
using namespace std;
const int maxn=1000;
int n,tot,i,j,now,x[maxn][maxn],y[maxn][maxn],heap[maxn],pos[maxn],key[maxn],sum[maxn];
bool exist[maxn];
void modify(int id,int newkey)
{
    int p;
    if (newkey<key[id])
    {
        key[id]=newkey;
        p=pos[id];
        while (p>1 && key[heap[p]]<key[heap[p/2]]) 
        {
            swap(pos[heap[p]],pos[heap[p/2]]);
            swap(heap[p],heap[p/2]);
            p=p/2;
        }    
    }    
}    
void heapify(int p)
{
    int best;
    best=p;
    while (p*2<=tot && key[heap[p*2]]<key[heap[best]]) best=p*2;
    while (p*2+1<=tot && key[heap[p*2+1]]<key[heap[best]]) best=p*2+1;
    if (best!=p)
    {
        swap(pos[heap[p]],pos[heap[best]]);
        swap(heap[p],heap[best]);
        heapify(best);
    }    
}    
void extract()
{
    int id,dis;
    id=heap[1];
    dis=key[id];
    i=id; now=dis;
    tot--;
    if (tot>0)
    {
        swap(pos[heap[1]],pos[heap[tot+1]]);
        swap(heap[1],heap[tot+1]);
        heapify(1);
    }    
}    
int main()
{
    freopen("dijkstra.in","r",stdin);
    freopen("dijkstra.out","w",stdout);
    scanf("%d",&n);
    for (i=1;i<=n;i++)
    {
        scanf("%d",&sum[i]);
        for (j=1;j<=sum[i];j++) scanf("%d %d",&x[i][j],&y[i][j]);    
    }    
    tot=n; 
    for (i=1;i<=n;i++)
    {
        pos[i]=i;
        heap[i]=i;
        exist[i]=true;
        key[i]=32768;
    }    
    key[1]=0;
    while (tot>0)
    {
        extract();
        if (now==32768)break;
        for (j=1;j<=sum[i];j++)
         modify(x[i][j],now+y[i][j]);
    }    
    printf("%d",key[n]);
    return 0;
}    
