#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <string>
using namespace std;

long long  f[6];


long long Sum_AP(int a0, int d, int n)
{
    if (n<=0) return 0; 
    long long sum;
    sum=(long long)(n)*a0+(long long)(d)*n*(n-1)/2;
    return sum; 
}


long long get(int num)
{
    if (num==0) return 1;
    if (num<0) return 0; 
    int ymax,xmin;
    long long cnt;

    ymax=num/5;
    xmin=(num-ymax*5)/2;
    cnt=Sum_AP(xmin+1,5,ymax/2+1);
    
    if (ymax>=1) 
    {
        xmin=(num-ymax*5+5)/2;
        cnt+=Sum_AP(xmin+1,10,(ymax-1)/4+1);
    }
    
    if (ymax>=3)
    {
        xmin=xmin+5;
        cnt+=Sum_AP(xmin+1,10,(ymax-3)/4+1);
    }
    
    return cnt; 
}


int main()
{
    freopen("sugar.in","r",stdin);
    freopen("sugar.out","w",stdout);
    int N;
    cin>>N;
    for (int i=0; i<=5; ++i) f[i]=get(N-i);
    
    long long ans;
    ans=f[0]+(f[1]+f[2]+f[3]+f[4])*2+f[5];
    cout<<ans<<endl;
    
    return 0;
}
