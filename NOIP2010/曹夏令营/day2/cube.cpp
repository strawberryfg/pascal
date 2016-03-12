#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
using namespace std;
int ans[1000],a[1000],b[1000],c[1000],temp[1000],fmax,fmax1,tot;
void print()
{
     int i;
     printf("%d",b[fmax1]);
     for (i=fmax1-1;i>=0;i--)
     {
         printf("%d",b[i]);
     }
}
bool pd;
bool ok(int now)
{
     bool mark=true;
     int i;
     for (i=0;i<=now;i++)
     {
         if(ans[tot-i]!=a[i]) return false;
     }
     for (i=now+1;i<=tot;i++)
     {    
         if (ans[tot-i]!=a[i]){mark=false;break;}
     }
     if (mark==true) pd=true;
     if (now==tot) pd=true;
     return true;
}
void gjd()
{
     int nowmax=fmax+fmax1,i,j,k;
     memset(c,0,sizeof(c));
     for (i=0;i<=fmax;i++)
     {
         for (j=0;j<=fmax1;j++)
         {
             c[i+j]=c[i+j]+a[i]*b[j];
             c[i+j+1]=c[i+j+1]+c[i+j]/10;
             if (i+j+1>nowmax) nowmax=i+j+1;
             c[i+j]=c[i+j]%10;
         }
     }
     k=nowmax+1;
     while (c[k]!=0)
     {
           c[k+1]=c[k+1]+c[k]/10;
           c[k]=c[k]%10;
           if (k>nowmax)nowmax=k;
           k++;
     }
     fmax=nowmax;
     for (i=0;i<=nowmax;i++) a[i]=c[i];
}
int main()
{
    freopen("cube.in","r",stdin);
    freopen("cube.out","w",stdout);
    char cc;
    int i,j,tt,m;
    cc=getchar(); tot=-1;
    while (cc!=EOF && cc!='\n')
    {
          ans[++tot]=int(cc)-48;
          cc=getchar();
    }
    fmax=-1; fmax1=fmax;
    pd=false;
    for (i=0;i<=tot;i++)
    {
        for (m=0;m<=fmax;m++) temp[m]=b[m];
        tt=fmax1;
        for (j=0;j<=9;j++)
        {       
             for (m=0;m<=fmax;m++) { a[m]=temp[m];}
             fmax=tt;
             a[++fmax]=j;
             for (m=0;m<=fmax;m++) { b[m]=a[m]; }
             fmax1=fmax;
             gjd();
             gjd();
             if (ok(i))break;
        }
        if (pd)break;
        
    }
    print();
    return 0;
}
