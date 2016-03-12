#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
using namespace std;

int a[100005],f[100005],g[100005],e[100005];
int maxx,n;
void com(int up1,int up2)
{
    int k=1,m=1,p=0,t=0,i;
   // memset(g,0,sizeof(g));
    while (k<=up1 && m<=up2)
    {
        if (f[k]>e[m]){ g[++p]=f[k];k++; }
        else {
                g[++p]=e[m];  m++;
             }    
        if (k>up1) for (i=m;i<=up2;i++) g[++p]=e[i];
        if (m>up2){ for (i=k;i<=up1;i++) { g[++p]=f[i]; }
                  }  
    }    
    g[0]=p;
    for (i=0;i<=maxx;i++) f[i]=g[i];
}    
void handle()
{
    int tot=0,i=0,j=0,t=0,k;
    while (i<=n)
    {
     //   memset(e,0,sizeof(e));
        while (j+1<=n && a[j]>a[j+1]) j++;
        tot++;
        for (k=i;k<=j;k++) e[k+1-i]=a[k];
        e[0]=j-i+1;   
        if (tot==1) for (k=0;k<=maxx;k++) f[k]=e[k];
        if (tot>1) com(f[0],e[0]);
        i=j+1; j=i;
    }        
}    
int main()
{
    freopen("guibing.in","r",stdin);
    freopen("guibing.out","w",stdout);
    int i;
    scanf("%d",&n);
    maxx=n;
    for (i=1;i<=n;i++) { scanf("%d",&a[i]); }    
    handle();
    for (i=1;i<=g[0];i++) printf("%d ",g[i]);
    printf("\n");
    return 0;
}    

