#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>
#include <string>
using namespace std;
int len1,len2,len3,a[100],b[100],c[100],x[100],y[100];
void print()
{
    int i;
    printf("%d",c[len3]);
    for (i=len1-1;i>=0;i--)
    {
        if (c[i]>999) printf("%d",c[i]);
           else if (c[i]>99) printf("0%d",c[i]);
               else if (c[i]>9) printf("00%d",c[i]);
                    else printf("000d",c[i]); 
    }    
    printf("\n");
}    
void gjd()
{
    memset(c,0,sizeof(c));
    int t=max(len1,len2),i;
    for (i=0;i<=t;i++)
    {
        c[i]=c[i]+x[i]+y[i];
        c[i+1]=c[i+1]+c[i]/10000;
        c[i]=c[i]%10000;
    }    
    if (c[t+1]!=0) t++;
    len3=t;
}    
int main()
{
    freopen("jiafa.in","r",stdin);
    freopen("jiafa.out","w",stdout);
    int tot,now,m,n,p,q,pos,t,i;
    char c;
    now=0;
    c=getchar();
    while (c!='\n') 
    {
        a[++now]=c-48;
        c=getchar();
    }   
    len1=now-1; 
    now=0;
    c=getchar();
    while (c!='\n' && c!=EOF) 
    {
        b[++now]=c-48;
        c=getchar();
    }       
    len2=now-1;
    pos=len1+2;
    tot=-1;
    while (pos>4) 
    {
        m=a[pos-4]; n=a[pos-3]; p=a[pos-2]; q=a[pos-1];
        t=m*1000+n*100+p*10+q;
        x[++tot]=t;
        pos-=4;
    }    
   if (pos!=1)
   {
           t=0; for (i=1;i<pos;i++)t=t*10+a[i];
           x[++tot]=t;
   }    
   len1=tot;
   pos=len2+2;
    tot=-1;
    while (pos>4) 
    {
        m=b[pos-4]; n=b[pos-3]; p=b[pos-2]; q=b[pos-1];
        t=m*1000+n*100+p*10+q;
        y[++tot]=t;
        pos-=4;
    }    
   if (pos!=1)
   {
           t=0; for (i=1;i<pos;i++)t=t*10+b[i];
           y[++tot]=t;
   }    
   len2=tot;
    gjd();
    print();
    return 0;
}     
