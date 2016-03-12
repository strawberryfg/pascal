#include <cstdio>
#include <cstdlib>
#include <algorithm>
#include <cstring>
using namespace std;
int a[10000002],temp[10000002];
void doit(int l,int r)
{
    int mid,p1,p2,p3,i;
    if (l==r) return;
    mid=(l+r)/2;
    doit(l,mid);
    doit(mid+1,r);
    p1=l; p2=mid+1; p3=l;
    while (p1<=mid && p2<=r)
    {
        if (a[p1]<a[p2]) temp[p3++]=a[p2++];
           else temp[p3++]=a[p1++];    
    }
    while (p1<=mid) temp[p3++]=a[p1++];
    while (p2<=r) temp[p3++]=a[p2++];
    for (i=l;i<=r;i++) a[i]=temp[i];
}    
int main()
{
    freopen("guibing.in","r",stdin);
    freopen("guibing.out","w",stdout);
    int n,i;
    scanf("%d",&n);
    for (i=1;i<=n;i++) scanf("%d",&a[i]);
    doit(1,n);
    for (i=1;i<=n;i++) printf("%d ",a[i]);
    printf("\n");
    printf("%d","s"-78);
    return 0;
}    
