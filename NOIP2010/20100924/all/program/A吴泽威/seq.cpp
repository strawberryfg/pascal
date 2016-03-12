#include <iostream>
#include <cstdio>
#include <cstdlib>
using namespace std;
int a[100010];

int main(){
    freopen("seq.in","r",stdin);
    freopen("seq.out","w",stdout);
    int n;
    cin>>n;
    for (int i=1;i<=n;i++) scanf("%d",&a[i]);
    int ans=2000000000;
    for (int i=1;i<n;i++) ans=min(ans,a[i+1]-a[i]+1);
    ans=max(0,ans);
    cout<<ans<<endl;
//system("pause");
}
