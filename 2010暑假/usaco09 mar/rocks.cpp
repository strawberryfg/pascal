#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <algorithm>
using namespace std;
const int two[16]={1,2,4,8,16,32,64,128,256,512,1024,2048,4096,
                   8192,16384,32768};
int hash[40000],b[40000][16],a[16],n;
void print()
{
    int i,j;  
    for (i=0;i<=n-1;i++) printf("%d",0);
    printf("\n");
    for (i=1;i<=two[n];i++)
    {
        for (j=n-1;j>=0;j--)
        {
            if (b[i][j]==0) printf("%d",0);
               else printf("%c",'X');
        }    
        printf("\n");
    }    

    exit(0);
}    
void dfs(int a[16],int dep,int depnum)
{
int i,t;
if (dep>two[n] && depnum==0) print();
else
 {
     if (dep>two[n]) return;
    for (i=0;i<=n-1;i++) b[dep][i]=a[i]; 
    for (i=0;i<=n-1;i++)
    {
        if (a[i]==0)
        {
            t=depnum+two[i];
            if (hash[t]==0 || dep+1>two[n]) 
              {a[i]=1; hash[t]=1; b[dep][i]=1; dfs(a,dep+1,t);
               a[i]=0; hash[t]=0; b[dep][i]=0;
              }
        } 
        else
        {
            t=depnum-two[i];
            if (hash[t]==0 || dep+1>two[n])
            {a[i]=0; hash[t]=1; b[dep][i]=0; dfs(a,dep+1,t);
             a[i]=0;hash[t]=0;  b[dep][i]=1;}
        }    
    }        
 }            
}    
int main()
{
    freopen("rocks.in","r",stdin);
    freopen("rocks.out","w",stdout);
    int i,j;
    scanf("%d",&n);
    memset(a,0,sizeof(a));
    memset(b,0,sizeof(b));
    memset(hash,0,sizeof(hash));
    hash[0]=1;
    dfs(a,1,0);
    return 0;
}    
