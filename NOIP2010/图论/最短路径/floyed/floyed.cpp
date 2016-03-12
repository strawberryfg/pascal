#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <algorithm>
using namespace std;
int main()
{
    freopen("floyed.in","r",stdin);
    freopen("floyed.out","w",stdout);
    int i,j,k,n,a[100][100],cost[100][100];
    scanf("%d",&n);
    for (i=1;i<=n;i++)
    {
        for (j=1;j<=n;j++)
        {
            scanf("%d",&cost[i][j]);
            a[i][j]=cost[i][j];
        }
    }
    for (k=1;k<=n;k++)
    {
        for (i=1;i<=n;i++)
        {
            for (j=1;j<=n;j++)
            {
                if (i!=j && j!=k && i!=j && a[i][k]+a[k][j]<a[i][j])
                a[i][j]=a[i][k]+a[k][j];
            }
        }
    }
    printf("%d",a[1][n]);
    return 0;
}
