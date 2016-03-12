#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>
using namespace std;
int s[100020],t[100020];
void qsort(int l,int r)
{
    int i=l,j=r,x=t[(l+r)/2];
    while (t[i]<x) i++;
    while (x<t[j]) j--;
    if (i<=j)
    {
        swap(t[i],t[j]);
        swap(s[i],s[j]);
        i++; j--;
    }    
    if (l<j) qsort(l,j);
    if (i<r) qsort(i,r); 
}    
int main()
{
    freopen("bobsled.in","r",stdin);
    freopen("bobsled.out","w",stdout);    
    int l,n,i,tmp,a,b,st,en,final;
    scanf("%d %d",&l,&n);
    for (i=1;i<=n;i++)
    {
        scanf("%d %d",&t[i],&s[i]);
    }    
    t[0]=0;s[0]=1;
    final=0; 
    qsort(1,n);
    for (i=1;i<=n;i++)
    {
        tmp=abs(s[i]-s[i-1]);
        if (tmp<=(t[i]-t[i-1])) continue;
        if (s[i]>s[i-1]) s[i]=s[i-1]+(t[i]-t[i-1]);
        else if (s[i]<s[i-1]) s[i-1]=s[i]+(t[i]-t[i-1]);
    }    
    for (i=n-1;i>=1;i--)
    {
        tmp=abs(s[i]-s[i+1]);
        if (tmp<=(t[i+1]-t[i])) continue;
        if (s[i]>s[i+1 ]) s[i]=s[i+1]+(t[i+1]-t[i]);
        else if (s[i]<s[i+1]) s[i+1]=s[i]+(t[i+1]-t[i]);        
    }    
    for (i=1;i<=n;i++)
    {
        tmp=abs(s[i]-s[i-1]);
        if (tmp==t[i]-t[i-1])
        {
             final=max(final,max(s[i],s[i-1]));
             continue;
         }    
        a=s[i-1]; b=s[i];
        if (a>b) swap(a,b);
        st=t[i-1]; en=t[i];
        en+=(b-a);
        tmp=en-st+1;
        tmp=(tmp+1)/2+a-1;
        final=max(final,tmp);
    }     
    tmp=s[n]+(l-t[n]);
    final=max(final,tmp);
    printf("%d\n",final);
    return 0;
}    
