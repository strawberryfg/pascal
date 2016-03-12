#include <iostream>
#include <cstdio>
#include <cstdlib>
using namespace std;
int a[310],b[310],f[310][310];

int main(){
    freopen("concert.in","r",stdin);
    freopen("concert.out","w",stdout);
    int n;
    cin>>n;
    a[0]=0,b[0]=0;
    for (int i=1;i<=n;i++){cin>>a[i]; a[i]+=a[i-1];}
    for (int i=1;i<=n;i++){cin>>b[i]; b[i]+=b[i-1];}
    for (int i=0;i<=n;i++)
    for (int j=0;j<=n;j++)
        f[i][j]=-1;
    f[0][0]=0;
//for (int i=0;i<=n;i++) cout<<b[i]<<endl;
    for (int i=1;i<=n;i++)
    for (int j=1;j<=n;j++)
    for (int p=0;p<i;p++)
    for (int q=0;q<j;q++){
        if (f[p][q]>-1) f[i][j]=max(f[i][j],f[p][q]+(a[i]-a[i-1])*(b[j]-b[j-1])-(a[i-1]-a[p])*(a[i-1]-a[p])-(b[j-1]-b[q])*(b[j-1]-b[q]));
        //if (f[2][2]==32) cout<<"fuck!!! "<<a[i-1]-a[p]<<b[j-1]-b[q]<<endl;//-sqr(a[i-1]-a[p])-sqr(b[j-1]-b[q])<<endl;
       // if (f[2][2]==32) cout<<"fdsafsaf "<<p<<' '<<q<<endl;
}
    int ans=-1;
    for (int i=1;i<=n;i++)
    for (int j=1;j<=n;j++)
        if (f[i][j]>-1) ans=max(ans,f[i][j]-(a[n]-a[i])*(a[n]-a[i])-(b[n]-b[j])*(b[n]-b[j]));
    cout<<ans<<endl;
//for (int i=1;i<=n;i++)
//for (int j=1;j<=n;j++)
//    cout<<i<<' '<<j<<' '<<f[i][j]<<endl;
//system("pause");
}
