#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>
using namespace std;
int m[10001],n[10001],a[101],g[101][101],tt[101],h,tot,now,t,sigma;

void handle()
{
    int i,x;
    if (a[m[now]]==a[n[now]]) {now++;return; }
    x=a[n[now]];
    for (i=1;i<=h;i++)
    {
        if (a[i]==x) 
        {
            sigma=sigma+a[m[now]]-a[i];
            a[i]=a[m[now]];
            
        }    
    }     
    now++;
    tot+=t;
}    
bool check()
{
    int t=a[1],i,res;
    res=t*h;
//    for (i=2;i<=h;i++) if (a[i]!=t) return false;
    if (sigma!=res) return false;
    return true;
}    
int main()
{
    freopen("wire.in","r",stdin);
    freopen("wire.out","w",stdout);
    int sum,edge,i,j,t1,t2;
    scanf("%d",&h);
    sum=0;edge=0; tot=0;
    for (i=1;i<=h;i++)
    {
        for (j=1;j<=h;j++)
        {
            scanf("%d",&g[i][j]);
            if (i<j && g[i][j]!=0)
            {
                sum++;
                m[sum]=i; n[sum]=j;
                tt[i]=g[m[i]][n[i]];
                tt[j]=g[m[j]][n[j]];
            }    
        }    
    }    
  for (i=1;i<=sum-1;i++)
    {
        for (j=i+1;j<=sum;j++)
        {
            t1=g[m[i]][n[i]]; t2=g[m[j]][n[j]];
            if (t1>t2) 
            {
                swap(m[i],m[j]);
                swap(n[i],n[j]);
            }     
        }    
    }   
    for (i=1;i<=h;i++) a[i]=i;
    sigma=(h+1)*h/2;
    now=1;
    while (!check())
    {
        edge++;
        t=g[m[now]][n[now]];
        handle();
    }    
    printf("%d\n",tot);
    return 0;
}    
