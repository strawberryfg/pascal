#include <cstdio>
#include <cstdlib>
#include <iostream>

using namespace std;

int n,k,c,a[10000],ans;
long f[10000];

int main()
{
    freopen("divide.in","r",stdin);
    freopen("divide.out","w",stdout);
    scanf("%d %d %d",&n,&k,&c);
    for (int i=0;i<n;i++) scanf("%d",&a[i]);
    sort(a,a+n);ans=0;
    for (int i=1;i<=n;i++)
    {
        f[i]=(a[i]-a[1])*(a[i]-a[1])+1;
        for (int j=1;j<i;j++)
            if (f[j]+1+(a[i]-a[j+1])*(a[i]-a[j+1])<f[i])
               f[i]=f[j]+1+(a[i]-a[j+1])*(a[i]-a[j+1]);    
    }
    printf("%d\n",f[n]);
}
