#include<cstring>
#include<cstdlib>
#include<iostream>
using namespace std;
long long f[16][16],a[16];
long n,k;
void init()
{
        cin>>n>>k;
        a[0]=0;
        for (int i=1;i<=n;i++)
        {
                cin>>a[i];
                a[i]+=a[i-1];
        }
        for (int i=0;i<=k;i++)
                for (int j=1;j<=n;j++)
                        f[i][j]=-999;
        for (int i=1;i<=n;i++) f[0][i]=a[i];
}
int main()
{
        freopen("bigexp.in","r",stdin);
        freopen("bigexp.out","w",stdout);
        init();
        for (int i=1;i<=k;i++)
                for (int j=i+1;j<=n;j++)
                        for (int l=i;l<=j-1;l++)
                        {
                                long long x=f[i-1][l]*(a[j]-a[l]),
                                              y=f[i-1][l]+(a[j]-a[l]);
                                if (x>f[i][j]) f[i][j]=x;
                                if (y>f[i][j]) f[i][j]=y;
                        }
        cout<<f[k][n]<<endl;
        return 0;
}