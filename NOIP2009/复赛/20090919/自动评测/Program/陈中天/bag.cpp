#include<iostream>

using namespace std;

long n,i;

long f[10000003],s[10000003],e[10000003];

int main()
{
    freopen("bag.in","r",stdin);
    freopen("bag.out","w",stdout);
    memset(f,0,sizeof(f));
    memset(s,0,sizeof(s));
    memset(e,0,sizeof(e));  
    f[0]=1;f[1]=s[1]=e[1]=1;
    cin>>n;
    for (i=2;i<=n;++i)
        {
            s[i]=((s[i-1]+f[i-1])%997);
            f[i]=((s[i]+e[i-1]+s[i-1]+f[i-2])%997);
            e[i]=((f[i-1]+e[i-2])%997);
        }
  cout<<f[n]<<endl;
  return 0;
}

