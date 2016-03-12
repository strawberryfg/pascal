#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
using namespace std;


const int MaxN=100010;
long long x[MaxN],s[MaxN];
int N;


int main()
{
    freopen("meeting.in","r",stdin);
    freopen("meeting.out","w",stdout);
    scanf("%d",&N);
    for (int i=1; i<=N; ++i) scanf("%I64d",&x[i]);
    s[0]=0;
    for (int i=1; i<=N; ++i)
    {
        scanf("%I64d",&s[i]);
        s[i]+=s[i-1];
    }
    
    long long  ans,now=0;
    for (int i=2; i<=N; ++i) now+=(x[i]-x[i-1])*(s[N]-s[i-1]);
    ans=now;
    for (int i=2; i<=N; ++i)
    {
        now+=(s[i-1]*2-s[N])*(x[i]-x[i-1]);
        ans=min(ans,now);
    }
    printf("%I64d\n",ans);
    return 0;
}
