#include <iostream>

using namespace std;

int n,k,c,a[10001];
unsigned long long f[10001];

int main(){
    freopen("divide.in","r",stdin);
    freopen("divide.out","w",stdout);
    cin>>n>>k>>c;
    for (int i=1;i<=n;i++)
        scanf("%d",&a[i]);
    sort(a+1,a+n+1);
    for (int i=1;i<=n;i++)
    {
        f[i]=(unsigned long long)1000000000*1000000000;
        for (int j=n-k;j>=0;j--)
            f[i]<?=f[j]+c+(unsigned long long)(a[i]-a[j+1])*(a[i]-a[j+1]);
    }
    cout<<f[n]<<endl;
    //system("pause");
    return 0;
}
