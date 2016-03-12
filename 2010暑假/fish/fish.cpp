#include <iostream>
using namespace std;
int p[26],d[26],t[26],acc[26],sigma[26][200],f[26][200];
int main()
{
    int i,j,k,res,up,down,tot,n,h,final;
    freopen("fish.in","r",stdin);
    freopen("fish.out","w",stdout);
    scanf("%d",&n);
    scanf("%d",&h);
    for (i=1;i<=n;i++) { scanf("%d",&p[i]); }
    for (i=1;i<=n;i++) { scanf("%d",&d[i]); }
    for (i=1;i<n;i++) { scanf("%d",&t[i]); acc[i]=acc[i-1]+t[i]; }  
    tot=h*12;
    for (i=0;i<=n;i++)
    {
       if (d[i]==0) up=tot-1; else up=p[i]/d[i];
       for (j=1;j<=up+1;j++)
       {
           sigma[i][j]=sigma[i][j-1]+p[i]-d[i]*(j-1);
       }        
    }    

    memset(f,0,sizeof(f));
    if (d[1]==0) up=tot-1; else up=p[1]/d[1];
    final=0;
    for (i=0;i<=up+1;i++)
    {
        f[1][i]=sigma[1][i];
        if (f[1][i]>final) final=f[1][i];
    }    
    for (i=2;i<=n;i++) 
    {
        down=acc[i-1];
        for (j=down;j<=tot;j++)
        {
            if (d[i]==0) up=tot-1; else  up=p[i]/d[i];
            for (k=0;k<=up+1;k++)
            {
                if (j-t[i-1]-k<0 ) break;
                res=f[i-1][j-t[i-1]-k]+sigma[i][k];
                if (j-k<acc[i-1] || j-k-t[i-1]<acc[i-2]) 
                {
                    res=0;
                }    
                if (res>f[i][j]) {f[i][j]=res; }
                if (f[i][j]>final ) 
                {
                    final=f[i][j];     
                }        
            }    
        }    
    }       
    printf("%d",final);
    printf("\n");     
    return 0;
}    
