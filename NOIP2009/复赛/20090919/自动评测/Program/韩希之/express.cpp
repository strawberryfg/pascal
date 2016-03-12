#include <iostream>

using namespace std;

int n,s,t,a[1000000],hash[1000];

int cal(int a,int b)
{
    int sum=0,maxn=0,minn=9;
    while (a>0)
    {
          sum+=a%10;
          a=a/10;
    }
    while (b>0)
    {
          minn<?=b%10;
          maxn>?=b%10;
          b=b/10;
    }
    return sum*maxn+minn;
}

int hash1(int k)
{
    if (k<1000) return hash[k];
    else return 0;
}

int main(){
    freopen("express.in","r",stdin);
    freopen("express.out","w",stdout);
    cin>>n;
    for (int i=1;i<=n;i++)
    {
        scanf("%d%d",&s,&t);
        if (s==t) {cout<<"0\n";continue;}
        if (t>1000) {cout<<"-1\n";continue;}
        memset(hash,0,sizeof(hash));
        int f=0,r=0;
        a[0]=s;
        while (f<=r)
        {
              int x=a[f];
              for (int i=0;i<=f;i++)
              {
                  int y=cal(x,a[i]);
                  if (!hash[y] && y!=s || hash[y]>hash1(x)+hash1(a[i])+1) {a[++r]=y;hash[y]=hash1(x)+hash1(a[i])+1;}
                  if (y==t) break;
                  y=cal(a[i],x);
                  if (!hash[y] && y!=s || hash[y]>hash1(x)+hash1(a[i])+1) {a[++r]=y;hash[y]=hash1(x)+hash1(a[i])+1;}
                  if (y==t) break;
              }
              if (a[r]==t) break;
              f++;
        }
        if (hash[t]==0 && t!=s) cout<<"-1\n";
        else cout<<hash[t]<<"\n";
    }
    //system("pause");
    return 0;
}
