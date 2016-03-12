#include<cstdio>
int main()
{
  freopen("sugar.in","r",stdin);
  freopen("sugar.out","w",stdout);
  long long n;
  scanf("%I64d",&n);
  printf("%I64d\n",(n+2)*(n+1)/2);
  return 0;
}
