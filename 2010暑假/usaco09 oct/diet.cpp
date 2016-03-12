#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>
using namespace std;
int hash[1000000],a[500];
int main()
{
    freopen("diet.in","r",stdin);
    freopen("diet.out","w",stdout);
    int h,n,i,j,t,res;
    scanf("%d %d",&h,&n);
    memset(hash,0,sizeof(hash));
    res=0;
    for (i=1;i<=n;i++)
    {
        scanf("%d",&a[i]);
    }       
    for (i=1;i<=n;i++)
    {
        hash[a[i]]=1;
        for (j=a[i];j<=h;j++)
        {
            if (hash[j-a[i]]==1) 
            {
                hash[j]=1;
                res=max(res,j);
            }    
            
        }    
    }    
    printf("%d\n",res);
    return 0;
}    
