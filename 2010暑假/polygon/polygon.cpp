#include <cstdio>
#include <cstring>
#include <cstdlib>
#include <algorithm>
using namespace std;
int pre[100],nex[100],num[100],a[100],f[100],fmax[100][100],fmin[100][100]; 
int com(int l,int r)
{
    int i,j,k,t1,t2,t3;
    for (i=1;i<=r;i++) {fmax[i][i]=a[i]; fmin[i][i]=a[i]; }
    for (i=2;i<=r;i++)
    {
        for (j=1;j<=r+1-i;j++)
        {
            for (k=j;k<j+i-1;k++)
            {
                if (f[k]==1)
                {
                    fmax[j][j+i-1]=max(fmax[j][j+i-1],fmax[j][k]+fmax[k+1][j+i-1]);
                    fmin[j][j+i-1]=min(fmin[j][j+i-1],fmin[j][k]+fmin[k+1][j+i-1]);
                }    
                else 
                {
                    t1=fmax[j][k]*fmax[k+1][j+i-1];
                    t2=fmin[j][k]*fmin[k+1][j+i-1];
                    t3=max(t1,t2);
                    fmax[j][j+i-1]=max(fmax[j][j+i-1],t3);
                    t1=fmin[j][k]*fmax[k+1][j+i-1];
                    t2=fmax[j][k]*fmin[k+1][j+i-1];
                    t3=min(t1,t2);
                    fmin[j][j+i-1]=min(fmin[j][j+i-1],t3);                    
                }    
            }    
        }    
    }    
    return fmax[l][r];
}    
int main()
{
    freopen("polygon.in","r",stdin);
    freopen("polygon.out","w",stdout);
    int n,opt,now,t,tmp,tot,i,j,k,next,res,final;
    char c;
    bool mark;
    scanf("%d",&n);
    c=getchar();
    opt=1;now=0;t=0;tot=0;
    c=getchar();
    memset(num,0,sizeof(num));
    memset(nex,0,sizeof(nex));
    memset(pre,0,sizeof(pre));
    while (c!='\n' && c!=EOF)
    {
        if (c==' ') 
        {
            tot++;
            if (tot%2==0)
            {
               num[now]=t*opt;  opt=1; t=0;
            }    
               
        }    
        else 
         if (c=='+' || c=='*')
         {
            if (c=='+') tmp=1; else tmp=2;
            if (now==0)
            {
                nex[n]=tmp; pre[1]=tmp; now++;
            }        
            else 
            {
                nex[now]=tmp; pre[++now]=tmp;
            }    
         }    
         else
         {
          if (c=='-') opt=-1;
          else t=t*10+(c-48);
         }    
          c=getchar();
    }    
     num[now]=t*opt;  opt=1; t=0; final=-2147483647;
     for (i=1;i<=n;i++)
     {
         memset(a,0,sizeof(a));
         memset(f,0,sizeof(f));
         for (j=1;j<=n;j++) for (k=1;k<=n;k++) fmax[j][k]=-2147483647;
         for (j=1;j<=n;j++) for (k=1;k<=n;k++) fmin[j][k]=2147483647;
         if (i==n) tmp=1; else tmp=i+1;
         tot=0; t=tmp; mark=true;
         while (t!=tmp || mark==true)
         {
             if (t==n) next=1; else next=t+1;
             a[++tot]=num[t];
             if (next!=tmp )f[tot]=nex[t];
             t=next;
             mark=false;
         }    
         res=com(1,tot);
         final=max(final,res);
     }        
     printf("%d\n",final);
    return 0;
}    
