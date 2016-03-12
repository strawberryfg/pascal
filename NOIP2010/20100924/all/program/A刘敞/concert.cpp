#include<iostream>
using namespace std;
int n,s1[1000],s2[1000],f[1000][1000],a[1000],b[1000];
int main()
{
    freopen("concert.in","r",stdin);
    freopen("concert.out","w",stdout);
    scanf("%d",&n);
    s1[0]=s2[0]=0;
    for (int i=1;i<=n;i++)
        {
          scanf("%d",&a[i]);
          s1[i]=s1[i-1]+a[i];
        }
    for (int i=1;i<=n;i++)
        {
          scanf("%d",&b[i]);
          s2[i]=s2[i-1]+b[i];
        }
    for (int i=1;i<=n+1;i++)
        {
             for (int j=1;j<=n+1;j++)
                 {
                      f[i][j]=a[i]*b[j]-s1[i-1]*s1[i-1]-s2[j-1]*s2[j-1];
                      if (i>1)
                      for (int k=1;k<j;k++)
                          f[i][j]>?=f[i-1][k]+a[i]*b[j]-(s2[j-1]-s2[k])*(s2[j-1]-s2[k]);
                      if (j>1)
                      for (int k=1;k<i;k++)
                          f[i][j]>?=f[k][j-1]+a[i]-b[j]-(s1[i-1]-s1[k])*(s1[i-1]-s1[k]);
                  }
         }
    printf("%d\n",f[n+1][n+1]);
    return 0;
}
