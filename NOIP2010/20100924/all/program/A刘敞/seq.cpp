#include<iostream>
using namespace std;
int n,a[1000000];
int main()
{
    freopen("seq.in","r",stdin);
    freopen("seq.out","w",stdout);
    scanf("%d",&n);
    int ans=2147483647;
    scanf("%d",&a[1]);
    for (int i=2;i<=n;i++)
        {
         scanf("%d",&a[i]);
         ans<?=a[i]-a[i-1]>?0;
        } 
    printf("%d\n",ans+1);
    return 0;
}
