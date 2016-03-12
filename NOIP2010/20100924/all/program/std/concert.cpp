#include <iostream>
#include <cstdio>
#include <cstdlib>
using namespace std;

const int MaxN=333;
long long a[MaxN],b[MaxN],f[MaxN][MaxN];

int main()
{
    freopen("concert.in","r",stdin);
    freopen("concert.out","w",stdout);
    int N;
    cin>>N;
    a[0]=0;
    b[0]=0;
    for (int i=1; i<=N; ++i) scanf("%lld\n",&a[i]);
    for (int i=1; i<=N; ++i) scanf("%lld\n",&b[i]);
    for (int i=1; i<=N; ++i) a[i]+=a[i-1];
    for (int i=1; i<=N; ++i) b[i]+=b[i-1];
    
    long long ans=0;
    for (int i=1; i<=N; ++i) f[i][1]=(a[i]-a[i-1])*b[1]-a[i-1]*a[i-1];
    for (int i=1; i<=N; ++i) f[1][i]=a[1]*(b[i]-b[i-1])-b[i-1]*b[i-1];
    for (int i=2; i<=N; ++i)
        for (int j=2; j<=N; ++j)
        {                  
            f[i][j]=-100000000;
            for (int k=i-1; k>=1; --k)
                f[i][j]=max(f[i][j],f[k][j-1]-(a[i-1]-a[k])*(a[i-1]-a[k]));
            for (int k=j-1; k>=1; --k)
                f[i][j]=max(f[i][j],f[i-1][k]-(b[j-1]-b[k])*(b[j-1]-b[k]));
            f[i][j]+=(a[i]-a[i-1])*(b[j]-b[j-1]);
        }
    for (int i=1; i<=N; ++i)
        for (int j=1; j<=N; ++j)
            ans=max(ans,f[i][j]-(a[N]-a[i])*(a[N]-a[i])-(b[N]-b[j])*(b[N]-b[j]));
    cout<<ans<<endl;
    return 0;
}
