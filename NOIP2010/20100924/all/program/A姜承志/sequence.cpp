#include<cstdio>
using namespace std;
int main()
  {
  unsigned long int i,n,o=0,a,b;
  freopen("sequence.in","r",stdin);
  freopen("sequence.out","w",stdout);
  scanf("%ld",&n);
  scanf("%ld",&a); 
  for (i=1;i<n;i++)
    {
    scanf("%ld",&b); 
    if (b-a>o) o=b-a;
    a=b;
    }
  printf("%ld\n",o);
  return 0;
  }
