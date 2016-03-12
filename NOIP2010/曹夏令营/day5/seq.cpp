#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
using namespace std;
int sum[1000020],dec[1000020],a[1000020],f[1000020];
int main()
{
    freopen("seq.in","r",stdin);
    freopen("seq.out","w",stdout);
    int i,n,j,fmax,t1,down;
    scanf("%d",&n);
    sum[0]=0; dec[0]=0;
    for (i=1;i<=n;i++)
    {
        scanf("%d",&a[i]);
        dec[i]=a[i]-a[i-1];
        sum[i]=sum[i-1]+dec[i];
        f[i]=1;
    }
    fmax=1;
    for (i=2;i<=n;i++)
    {
        if (n<=10000) down=max(1,i-3000);
           else if (n<=100000)down=max(1,i-300);
                 else down=max(1,i-30);
        for (j=down;j<=i-1;j++)
        {
            t1=sum[i]-sum[j];
            if (abs(t1)!=1 && f[j]+1>f[i]) f[i]=f[j]+1;
        }
        if (f[i]>fmax)fmax=f[i];
    }
    printf("%d\n",fmax);
    return 0;
}
