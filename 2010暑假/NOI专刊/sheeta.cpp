#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
using namespace std;

long long final,a[100005],sum[100005],res[100005],f[100005],g[100005],e[100005];
int maxx,n;
void com(int up1,int up2)
{
    int k=1,m=1,p=0,t=0,i;
   // memset(g,0,sizeof(g));
    while (k<=up1 && m<=up2)
    {
        if (f[k]>e[m]){ g[++p]=f[k];k++; }
        else {
                if (f[k]<e[m])  
                   t+=(up1+1-k); 
                g[++p]=e[m];  m++;
             }    
        if (k>up1) for (i=m;i<=up2;i++) g[++p]=e[i];
        if (m>up2){ for (i=k;i<=up1;i++) { g[++p]=f[i]; }
                         if (f[k]==e[up2] && f[i]<e[up2]) {t++; }
                  }  
    }    
    final+=t;
    g[0]=p;
    for (i=0;i<=maxx;i++) f[i]=g[i];
}    
void handle()
{
    int tot=0,i=0,j=0,t=0,k;
    while (i<=n)
    {
     //   memset(e,0,sizeof(e));
        while (j+1<=n && res[j]>res[j+1]) j++;
        tot++;
        for (k=i;k<=j;k++) e[k+1-i]=res[k];
        e[0]=j-i+1;   
        if (tot==1) for (k=0;k<=maxx;k++) f[k]=e[k];
        final+=t;
        if (tot>1) com(f[0],e[0]);
        i=j+1; j=i;
    }        
}    
int main()
{
    freopen("sheeta.in","r",stdin);
    freopen("sheeta.out","w",stdout);
    int m,i;
    scanf("%d %d",&n,&m);
    maxx=n;
    memset(sum,0,sizeof(sum));
    res[0]=0;
    for (i=1;i<=n;i++) { scanf("%d",&a[i]); sum[i]=sum[i-1]+a[i]; }    
    for (i=1;i<=n;i++) { res[i]=sum[i]-i*m; }
    handle();
    printf("%lld\n",final);
    return 0;
}    

