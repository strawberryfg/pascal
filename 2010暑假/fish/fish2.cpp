//fish  by David Liu
#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<cstring>
using namespace std;
int f[100],d[100],t[100],x[100][1000],num[100][1000],n,h;
bool y[100][1000];
int ans(int nn,int time)
{
    if (y[nn][time]) return x[nn][time];
  //  if (time==0) return 0;
    int p=num[nn][time];
    if (nn==n||time<=t[nn]) return p;
    int tt=time-t[nn];
    for (int i=tt;i>=0;i--)
        {
             int k=num[nn][i]+ans(nn+1,time-i-t[nn]);
             if (k>p) p=k;
         }
    y[nn][time]=1;
    x[nn][time]=p;
    return p;
}
int main()
{
    freopen("fish.in","r",stdin);
    freopen("fish.out","w",stdout);
    scanf("%d %d",&n,&h);
    h=h*12;
    for (int i=1;i<=n;i++)
        scanf("%d",&f[i]);
    for (int i=1;i<=n;i++)
        scanf("%d",&d[i]);
    for (int i=1;i<=n-1;i++)
        scanf("%d",&t[i]);
    memset(num,0,sizeof(num));
    for (int i=1;i<=n;i++)
        {
        num[i][1]=f[i];
        for (int j=2;j<=h;j++)
            num[i][j]=num[i][j-1]+max(f[i]-d[i]*(j-1),0);
        }
    memset(y,0,sizeof(y));
    printf("%d\n",ans(1,h));
    return 0;
}
