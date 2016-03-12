#include<iostream>
using namespace std;
const long long f[6]={0,3,6,10,15,21};
const long long g[6]={1,1,2,2,3,4};
long long ff(long long n){
    if (n<=5) return g[n];
    if (n%2==1) return ff(n-5)+n/2+1;
    long long a1,a2,a3,aa;
    a1=n/2+1; a2=(n-5)/2+1;
    a3=a1+a2;
    if (a1/5==a2/5) aa=(a3+a3%10)*(a2/5+1)/2;
    if (a1/5!=a2/5){
       if (n%5==0) aa=(a3+a3%10)*(a2/5+1)/2+1; else aa=(a3+a3-a1/5*10)*(a1/5+1)/2+5-a2%5;
    }
    return aa;
}
int main(){
    long long n;
    freopen("sugar.in","r",stdin);
    freopen("sugar.out","w",stdout);
    cin>>n;
    if (n<=5) cout<<f[n]<<endl; else
    cout<<ff(n)+2*ff(n-1)+2*ff(n-2)+2*ff(n-3)+2*ff(n-4)+ff(n-5)<<endl;
/*    cout<<ff(100)<<endl;
    cout<<ff(99)<<endl;
    cout<<ff(98)<<endl;
    cout<<ff(97)<<endl;
    cout<<ff(96)<<endl;
    cout<<ff(101)<<endl;
    system("pause");*/
}
