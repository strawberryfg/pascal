#include <iostream>
#include <cstring>
using namespace std;

int b[101],be[101],en[101],f[101][101],c[101][101],p[101],acc[101],res;
int main()
{
    freopen("book.in","r",stdin);
    freopen("book.out","w",stdout);
    int n,k,i,j,m,t,a,tot,ol,ne;
    scanf("%d %d",&n,&k);
    memset(f,0,sizeof(f));
    
    for (i=1;i<=n;i++)
    {
       scanf("%d",&p[i]);   
       acc[i]=p[i];
       acc[i]+=acc[i-1];
       f[1][i]=acc[i];
       c[1][i]=i;
    }      
    if (n==1)
    {
        printf("%d %d\n",1,1);
    }    
    else if (k==1)
          {
              printf("%d %d\n",1,n);
          }    
          else
    {
    for (i=2;i<=k;i++)
    {
        for (j=1;j<=n;j++)
        {
            for (m=i-1;m<=j-1;m++)
            {
              
                t=max(f[i-1][m],acc[j]-acc[m]);
                if (t<f[i][j] || f[i][j]==0)
                {
                    f[i][j]=t;
                    c[i][j]=m;
                }    
                else if (t=f[i][j] && m<c[i][j])
                         {
                              f[i][j]=t;
                              c[i][j]=m;
                         }     
                       
            }           
        }    
    }   
    res=f[k][n];
    ol=n; ne=n;
    for (i=k;i>=1;i--)
    {
        while ((acc[ol]-acc[ne-1]<=res )&&( ne-1>=0 )&& (ne>=i-1)) 
        { 
            ne--;
        }
        be[i]=ne+1; en[i]=ol;
        ol=ne; ne=ol;
    }    
    for (i=1;i<=k;i++)
    {
        printf("%d %d\n",be[i],en[i]);
    }    
   }  
     
    return 0;
}    
