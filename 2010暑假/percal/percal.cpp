#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>
using namespace std;
int a[2001][2001],l[2001][2001],r[2001][2001],h[2001][2001],sum[100][100],be[100][100],en[100][100],hash[100];
int main()
{
    freopen("percal.in","r",stdin);
    freopen("percal.out","w",stdout);
    int n,final,i,j,now,tmp,x,y,k,m,area;
    scanf("%d",&n);
    for (i=0;i<=n;i++) for (j=1;j<=n;j++)
    {
        h[i][j]=0; l[i][j]=1; r[i][j]=n;
    }    
    memset(be,0,sizeof(be));
    memset(en,0,sizeof(en));
    final=0;
    for (i=1;i<=n;i++)
    {
        sum[i][0]=0;
        now=0; tmp=0; x=0; y=0;
        for (j=1;j<=n;j++)
        {
            scanf("%d",&a[i][j]);
            sum[i][j]=sum[i][j-1]+a[i][j];
            if (sum[i][j]!=tmp) 
            {
                tmp=sum[i][j];
                if (j!=1)
                {
                    for (k=x+1;k<=y;k++) {be[i][k]=x+1; en[i][k]=y; }
                }    
                x=j; y=0;
            }    
            else
            {
                y=j;
            }    

        }          
        if (y==n) 
        {
                    for (k=x+1;k<=y;k++) {be[i][k]=x+1; en[i][k]=y; }
        }    
    }    

    for (i=1;i<=n;i++)
    {
        for (k=1;k<=n;k++)
        {
            if (be[i][k]!=0)
            {
                    h[i][k]=h[i-1][k]+1;
                    l[i][k]=max(l[i-1][k],be[i][k]);
                    r[i][k]=min(r[i-1][k],en[i][k]);
            
            area=(r[i][k]-l[i][k]+1)*h[i][k];
            final=max(area,final);    
            }    
        }    
    }    
    printf("%d",final);
    return 0;
}    
