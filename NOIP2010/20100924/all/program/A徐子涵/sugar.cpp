#include<iostream>
using namespace std;
__int64 N,ans;
int main(void){
    freopen("sugar.in","r",stdin);
    freopen("sugar.out","w",stdout);
    cin>>N;
    ans=(N*N+3*N+2)/2;
    cout<<ans<<endl;
}
