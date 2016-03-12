#include<iostream>
#include<cstdio>
#include<cstring>
using namespace std;
const int d[3]={1,2,5};
int f[20000];
int main()
{
  //freopen("sugar.in","r",stdin);
  //freopen("sugar.out","w",stdout);
  /*int n;
  scanf("%d",&n);*/
  for(int n=1;n<=10;++n)
  {
  memset(f,0,sizeof f);
  f[0]=1;
  for(int i=0;i<3;++i)
    for(int j=d[i];j<=n;++j)
      f[j]+=f[j-d[i]];
  int ans=f[n];
  if(n>0)
    ans+=f[n-1]<<1;
  if(n>1)
    ans+=f[n-2]<<1;
  if(n>2)
    ans+=f[n-3]<<1;
  if(n>3)
    ans+=f[n-4]<<1;
  if(n>4)
    ans+=f[n-5];
  printf("%d=%d\n",n,ans);}
  system("pause");
  return 0;
}
