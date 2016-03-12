#include<iostream>
using namespace std;
long long n,i,u,d,a[100005],tot[100005],s;
int main(){
    freopen("seq.in","r",stdin);
    freopen("seq.out","w",stdout);
    cin>>n; scanf("%d",&a[0]); a[0]*=2; tot[0]=0; tot[1]=a[0];
    for (i=1;i<n;i++) {scanf("%d",a+i); a[i]*=2; tot[i+1]=a[i]-tot[i];}
    u=2147483647; d=-2147483647;
    for (i=1;i<=n;i++){
        s=tot[i]-tot[i-1];
//        cout<<s<<endl;
        if (i%2==1) u<?=s; else d>?=-s;
    }
//    cout<<u<<endl; cout<<d<<endl;
    u/=2; d/=2;
    if (d<=u) cout<<u-d+1<<endl; else cout<<0<<endl;
//    system("pause");
}
