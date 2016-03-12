#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>
#include <string>

using namespace std;
const int num[5][5]={{5,-1,-2,-1,-3},
               {-1,5,-3,-2,-4},
               {-2,-3,5,-2,-2},
               {-1,-2,-2,5,-1},
               {-3,-4,-2,-1,32767}};
int s[256],f[100][100];               
int main()
{
    freopen("gene.in","r",stdin);
    freopen("gene.out","w",stdout);
    string a,b;
    char c;
    int i,j,len1,len2,res,x,y;
    a=""; b="";
    scanf("%d",&len1);
    c=getchar();
    while (c!='\n') 
    {
        if (c!=' ') a=a+c;
        c=getchar();
    }    
    scanf("%d",&len2);
    c=getchar();
    while (c!=EOF)
    {
        if (c!='\n' && c!=' ') b=b+c;
        c=getchar();
    }    
    memset(f,0,sizeof(f));
    s['A']=0; s['C']=1; s['G']=2; s['T']=3; s['-']=4;
    for (i=1;i<=len1;i++) 
        {
            x=s[a[i-1]];
            f[i][0]=f[i-1][0]+num[x][4];
        }    
    for (i=1;i<=len2;i++) 
        {
            y=s[b[i-1]];
            f[0][i]=f[0][i-1]+num[4][y];
        }    
    for (i=1;i<=len1;i++)
    {
        for (j=1;j<=len2;j++)
        {
            res=-2147483645;
            x=s[a[i-1]]; y=s[b[j-1]];
            res=max(res,f[i-1][j-1]+num[x][y]);
            res=max(res,f[i-1][j]+num[x][4]);
            res=max(res,f[i][j-1]+num[4][y]);
            f[i][j]=res;
        }    
    }    
    printf("%d",f[len1][len2]);
    printf("\n");
    return 0;
}    
