#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>
using namespace std;
int up[200],down[200],can[10000];
double res,need,f[10000];
int main()
{
    freopen("lifts.in","r",stdin);
    freopen("lifts.out","w",stdout); 
    int i,j,k,lifts,floor,a,b;
    scanf("%d %d",&lifts,&floor);

    for (i=1;i<=lifts;i++)
    {
        scanf("%d %d",&down[i],&up[i]);
    }    
    memset(f,0,sizeof(f));
    memset(can,0,sizeof(can));
    can[floor]=1;
    for (i=floor;i>=1;i--)
    { 
        if (can[i]==0)continue;
        for (j=1;j<=lifts;j++)
        {
            for (k=down[j];k<=up[j];k++)
            {
                a=up[j]-i; b=i-down[j];
                need=(double)(a*(a+1)+b*(b+1))/(double)(2*(a+b+1));
                res=need+abs(i-k)+f[i];
                if (f[k]==0 || res<f[k]) f[k]=res;
                can[k]=1;
            }    
        }    
    }    
    printf("%0.5f\n",f[1]);
    return 0;
}    
