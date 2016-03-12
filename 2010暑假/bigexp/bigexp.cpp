#include <iostream>
#include <cstring>
using namespace std;

int main()
{
    freopen("bigexp.in","r",stdin);
    freopen("bigexp.out","w",stdout);
    int i,j,n,k,l,m,t,a[17];
    long long f[20][20][20],t1,t2,t3;
    scanf("%d %d",&n,&k);
    memset(f,0,sizeof(f));
    for (i=0;i<n;i++)
    {
        scanf("%d",&a[i]);
        f[i][i][0]=a[i];
    }        
    for (i=2;i<=n;i++)
    {
        for (j=0;j<=n-i;j++)
        {
            for (l=j;l<=j+i-2;l++)
            {
               for (t=0;t<=min(i-1,k);t++)
               {
                   for (m=0;m<=min(t,l-j);m++)
                   {
                       t1=0; t2=0; t3=f[j][j+i-1][t];
                       if (m<=l-j&&t-m<=j+i-l-2) t1=f[j][l][m]+f[l+1][j+i-1][t-m];
                       if (t-m-1>=0&&m<=l-j&&t-m-1<=j+i-l-2) t2=f[j][l][m]*f[l+1][j+i-1][t-m-1]; 
                       f[j][j+i-1][t]=max(max(t1,t2),t3);
                   
                   }    
               }    
            }    
        }    
    }   
    printf("%lld",f[0][n-1][k]); 
    return 0;
}
