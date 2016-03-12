#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
using namespace std;
const int maxn=50010;
int len[maxn],c[50],d[50];
long long fmin[maxn];
struct typ
{
       int pos,num;
}x[maxn],y[maxn],z[maxn],w[maxn];
bool cmp(typ p,typ q)
{
     return p.num<=q.num;
}
int main()
{
    freopen("acquire.in","r",stdin);
    freopen("acquire.out","w",stdout);
    int i,j,k,a,nowmax,n,p,q,tot;
    long long t;
    scanf("%d",&n);
    for (i=1;i<=n;i++)
    {
        scanf("%d %d",&p,&q);
        x[i].num=p; x[i].pos=i; z[i].num=p;
        y[i].num=q; y[i].pos=i; w[i].num=q;
    }
    memset(fmin,0,sizeof(fmin));
    sort(x+1,x+n+1,cmp);
    sort(y+1,y+n+1,cmp);
    t=(x[1].num)*(w[x[1].pos].num);
    tot=-1;
    fmin[1]=t;
    for (i=2;i<=n;i++)
    {
        fmin[i]=0;
        for (j=max(0,i-100);j<=i-1;j++)
        {
            a=x[i].num; 
            nowmax=0;
            for (k=j+1;k<=i;k++)
            {
                t=x[k].pos;
                {
                    if (w[t].num>nowmax)nowmax=w[t].num;
                }
            }
                tot=-1;
                t=a*nowmax;
                memset(c,0,sizeof(c));
           if ((long long )fmin[j]+t<fmin[i] || fmin[i]==0) fmin[i]=(long long )fmin[j]+t;   
        }  
    }
    cout<<fmin[n]<<endl;
    return 0;
}
