#include <iostream>
#include <cstdio>
#include <cstdlib>
using namespace std;
#define ll long long
int n;
ll ans=0;

void work40(){
    ll ans=0;
    for (int i=0;i<=min(n,1);i++)
    for (int j=0;j<=min(n-i,4);j++){
        ll cnt=0,m=n-i-j;
        for (int k=0;k*5<=m;k++) cnt+=(m-k*5)/2+1;
        ans+=cnt;
        //cout<<m<<' '<<cnt<<endl;
    }
    cout<<ans<<endl;
    return;
}

void work100(){
    for (int i=0;i<=min(n,1);i++)
    for (int j=0;j<=min(n-i,4);j++){
        ll cnt=0,m=n-i-j,cnt1,cnt2,a1,an;
        cnt1=m%5/2+1;
        cnt2=(m%5+5)/2+1;
        if (cnt2-cnt1==2){
            a1=cnt1+cnt2;
        } else {
            cnt+=cnt1;
            a1=cnt2+(m%5+10)/2+1;
        }
        cnt2=m/2+1;
        cnt1=(m-5)/2+1;
        if (cnt2-cnt1==2){
            an=cnt1+cnt2;  
        } else {
            cnt+=cnt2;
            an=cnt1+(m-10)/2+1;
        }
        ll nn=(an-a1)/10+1;
        cnt+=(a1+an)*nn/2;
        //cout<<m<<' '<<cnt<<endl;
        //cout<<"a1 "<<a1<<" an "<<an<<endl;
        ans+=cnt;
    }
    cout<<ans<<endl;
    return;
}

int main(){
    freopen("sugar.in","r",stdin);
    freopen("sugar.out","w",stdout);
    cin>>n;
    if (n<=10000) work40(); else work100();
//system("pause");
}
