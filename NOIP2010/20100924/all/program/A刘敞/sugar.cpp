#include<iostream>
using namespace std;
long long n,f[10];
int main()
{
    freopen("sugar.in","r",stdin);
    freopen("sugar.out","w",stdout);
    cin>>n;
    for (int i=0;i<=5;i++)
        {
          if (i>n) break;
          long long k=n-i;
          f[i]=(k+k%5)*(k/5+1)/4+k/5+1;
         }
    cout<<f[0]+f[1]*2+f[2]*2+f[3]*2+f[4]*2+f[5]<<endl;
    return 0;
}
