#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
using namespace std;

const int MaxN=100010;
const int Inf=1000000000;
int N;
int a[MaxN],low[MaxN],high[MaxN];


int main()
{
    freopen("seq.in","r",stdin);
    freopen("seq.out","w",stdout);
    cin>>N;
    ++N;
    for (int i=2; i<=N; ++i) scanf("%d",&a[i]);
    a[1]=-Inf;
    a[N+1]=Inf;
    for (int i=1; i<=N; ++i)
    {
        low[i]=a[i];
        high[i]=a[i+1];
    }
    
    int ans=Inf;
    for (int i=N-1; i>=1; --i)
    {
        low[i]=max(low[i],a[i+1]*2-high[i+1]);
        high[i]=min(high[i],a[i+1]*2-low[i+1]);
        ans=min(ans,high[i]-low[i]+1);
    }
    (ans<=0) ? printf("0\n") : printf("%d\n",ans);
    return 0;
}
