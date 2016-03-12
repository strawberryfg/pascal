#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
int frommax[100000],fmax[100000],a[100000],b[100000],nowmax;
using namespace std;
int main()
{
    freopen("game.in","r",stdin);
    freopen("game.out","w",stdout);
    int n,i,j,x,y,p,q,k,num,fmin,tot,t1,t2,t3,t4;
    scanf("%d",&n);
    fmax[0]=0; frommax[0]=0;
    for (i=1;i<=n;i++)
    {
        scanf("%d %d",&x,&y);
        nowmax=max(x+y,fmax[i-1]);
        num=0; fmin=2147483647; tot=0;
        for (j=1;j<=i-1;j++)
        {
            t1=a[j]; t2=b[j]; t3=x; t4=y;
            p=x+t2; q=y+t1;
            k=max(p,q);
            if (fmax[i-1]==t1+t2 ) 
            { 
                tot++;      
                if (k<fmax[i-1])
                {
                fmin=k;           
                num=j; 
                }
            }
        }
        if (tot==1 && num!=0)
        {
            a[i]=x; b[i]=y;
            swap(a[num],a[i]);
            fmax[i]=k;
        }
        else
        {
            a[i]=x; b[i]=y;
            fmax[i]=nowmax;
        }
        printf("%d\n",fmax[i]);
    }
    return 0;
}
