#include<iostream>
using namespace std;
int a[200];
int main(){
    int n,k,i,j,s,tot;
    freopen("panda.in","r",stdin);
    freopen("panda.out","w",stdout);
    cin>>n>>k;
    for (i=0;i<n;i++) cin>>a[i];
    tot=-1;
    for (i=1;tot!=k;i++){
        s=i;
        for (j=0;j<n;j++) while (s%a[j]==0) s/=a[j];
        if (s==1) tot++;
    }
    cout<<i-1<<endl;
    return 0;
}
