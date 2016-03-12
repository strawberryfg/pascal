#include<iostream>
#include<cstdio>
#include<cstring>
using namespace std;
int a[400],b[400],sa[400],sb[400],f[400][400];
int sqr(int x)
{
  return x*x;
}
int ms(int i,int j)
{
  if(f[i][j]==-1)
    for(int k=1;k<=i;++k)
      for(int l=1;l<=j;++l)
      {
        int t=ms(k-1,l-1)+a[i]*b[j]-sqr(sa[i-1]-sa[k-1])-sqr(sb[j-1]-sb[k-1]);
        if(t>f[i][j])
          f[i][j]=t;
      }
  if(i==1)
    f[i][j]-=sqr(sb[j-1]);
  if(j==1)
    f[i][j]-=sqr(sa[i-1]);
  return f[i][j];
}
int main()
{
  freopen("concert.in","r",stdin);
  freopen("concert.out","w",stdout);
  memset(sa,0,sizeof sa);
  memset(sb,0,sizeof sb);
  memset(f,0,sizeof f);
  int n;
  scanf("%d",&n);
  for(int i=1;i<=n+1;++i)
    for(int j=1;j<=n+1;++j)
      f[i][j]=-1;
  for(int i=1;i<=n;++i)
  {
    scanf("%d",&a[i]);
    sa[i]=sa[i-1]+a[i];
  }
  a[n+1]=0;
  sa[n+1]=sa[n];
  for(int i=1;i<=n;++i)
  {
    scanf("%d",&b[i]);
    sb[i]=sb[i-1]+b[i];
  }
  b[n+1]=0;
  sb[n+1]=sb[n];
  printf("%d\n",ms(n+1,n+1));
  return 0;
}
