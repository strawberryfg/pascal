#include<iostream>
#include<cstdio>
#include<cstring>
using namespace std;
int c[200000],s[200000];
int main()
{
  freopen("seq.in","r",stdin);
  freopen("seq.out","w",stdout);
  int n;
  scanf("%d%d",&n,c);
  for(int i=1;i<n;++i)
  {
    scanf("%d",&c[i]);
    if(c[i]<c[i-1])
    {
      putchar('0');
      return 0;
    }
  }
  printf("%d\n",c[1]-c[0]+1);
  return 0;
}
