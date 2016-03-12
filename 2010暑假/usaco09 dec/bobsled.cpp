#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>
using namespace std;
int s[100020],t[100020];
struct typ
{
    int s,t;
}cor[100020];
bool cmp(typ a,typ b)
{
    return a.t<b.t;
}      
int main()
{
    freopen("bobsled.in","r",stdin);
    freopen("bobsled.out","w",stdout);    
    int l,n,i,tmp,a,b,st,en,final;
    scanf("%d %d",&l,&n);
    for (i=1;i<=n;i++)
    {
        scanf("%d %d",&cor[i].t,&cor[i].s);
    }    
    cor[0].t=0;cor[0].s=1;
    final=0; 
    sort(cor+0,cor+n+1,cmp);
    for (i=1;i<=n;i++)
    {
        tmp=abs(cor[i].s-cor[i-1].s);
        if (tmp<=(cor[i].t-cor[i-1].t)) continue;
        if (cor[i].s>cor[i-1].s) cor[i].s=cor[i-1].s+(cor[i].t-cor[i-1].t);
        else if (cor[i].s<cor[i-1].s) cor[i-1].s=cor[i].s+(cor[i].t-cor[i-1].t);
    }    
    for (i=n-1;i>=1;i--)
    {
        tmp=abs(cor[i].s-cor[i+1].s);
        if (tmp<=(cor[i+1].t-cor[i].t)) continue;
        if (cor[i].s>s[i+1 ]) cor[i].s=cor[i+1].s+(cor[i+1].t-cor[i].t);
        else if (cor[i].s<cor[i+1].s) cor[i+1].s=cor[i].s+(cor[i+1].t-cor[i].t);        
    }    
    for (i=1;i<=n;i++)
    {
        tmp=abs(cor[i].s-cor[i-1].s);
        if (tmp==cor[i].t-cor[i-1].t)
        {
             final=max(final,max(cor[i].s,cor[i-1].s));
             continue;
         }    
        a=cor[i-1].s; b=cor[i].s;
        if (a>b) swap(a,b);
        st=cor[i-1].t; en=cor[i].t;
        en+=(b-a);
        tmp=en-st+1;
        tmp=(tmp+1)/2+a-1;
        final=max(final,tmp);
    }     
    tmp=cor[n].s+(l-cor[n].t);
    final=max(final,tmp);
    printf("%d\n",final);
    return 0;
}    
