/* 
ID:xiaweiy1
LANG:C++
TASK:concom
*/
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
using namespace std;
int hash[101][101],com[101][101],control[101][101],x[10020],y[10020];
int main()
{
    freopen("concom.in","r",stdin);
    freopen("concom.out","w",stdout);
    int sum,n,tot,i,j,k,a,b,cost,count;
    bool find;
    scanf("%d",&sum);
    n=0;
    memset(hash,0,sizeof(hash));
    memset(com,0,sizeof(com));
    memset(control,0,sizeof(control));
    count=0;
    for (i=1;i<=sum;i++)
    {
        scanf("%d %d %d",&a,&b,&cost);
        com[a][b]=cost;
        n=max(max(a,b),n);
    }
    for (i=1;i<=n;i++) control[i][i]=1;
    find=true;
    while (find)
    {
    find=false;
    for (i=1;i<=n;i++)
    {
        for (j=1;j<=n;j++)
        {
         if (i==j)continue;
         if (com[i][j]>50 && control[i][j]==0)
         { 
              control[i][j]=1;
              find=true;
              x[++count]=i; y[count]=j;
         }
        } 
    }
    for (i=1;i<=n;i++)
    {
        for (j=1;j<=n;j++)
        {
            if (i==j || control[i][j]==1)continue;
            tot=0;
            for (k=1;k<=n;k++)
            {
                if ( control[i][k]==1)
                {
                   tot+=com[k][j];
                }
            }
            if (tot>50)
            {
               find=true;
               control[i][j]=1;
               x[++count]=i;
               y[count]=j;
            }
        }
    }
}
    for (i=1;i<=count-1;i++)
    {
        for (j=i+1;j<=count;j++)
        {
            if (x[i]==x[j] && y[i]>y[j] || x[i]>x[j])
            {
               swap(x[i],x[j]);
               swap(y[i],y[j]);
            }
        }
    }
    for (i=1;i<=count;i++)
    {
        printf("%d %d\n",x[i],y[i]);
    }
    return 0;
}
