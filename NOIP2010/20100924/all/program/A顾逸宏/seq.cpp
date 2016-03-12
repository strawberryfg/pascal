#include<iostream>
using namespace std;
int n,ans;
int a[1000000];
int check(int x)
{
    bool lo=true;
    int x1=x;
    int x2=0;
    int dep=1;
    while (lo && dep<n+1){
          dep++;
          x2=a[dep-1]*2-x1;
          if (x2<x1)
             lo=false;
          x1=x2;x2=0;
          }
    return lo;
}
          
          

int main(){
    freopen("sequence.in","r",stdin);
    freopen("sequence.out","w",stdout);   
    cin>>n;
    for (int i=1;i<=n;i++)
        cin>>a[i];
    for (int i=-a[2];i<=a[2];i++)
        {
             if (check(i))
                {
                  ans++;
                  }
                else if (ans!=0) 
                     break;
                }
    cout<<ans;
    //system("pause");
}
             
