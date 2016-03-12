#include<iostream.h>
#include<fstream.h>

int a[1001],b[1001],f[1000];

void main()
{
 ifstream cin("hunger.in");
 ofstream cout("hunger.out");
 int B;
 int i , j;
 cin>>B;
 for (i=1;i<=B;i++)
  cin>>a[i]>>b[i];

 for (i=1;i<B;i++)
  for (j=i+1;j<=B;j++)
   if (b[i]>b[j])
    {
      int temp ;
      temp = a[i];
      a[i] = a[j];
      a[j] = temp;
      temp = b[i];
      b[i] = b[j];
      b[j] = temp;
    }

  for (i=1;i<=B;i++)
   {
     f[i]=0;
     for (j=1;j<i;j++)
      if (b[j]<a[i] && f[j]>f[i])
       f[i]=f[j];
     f[i]+=b[i]-a[i]+1;
   }

  int ans = 0;
  for (i=1;i<=B;i++)
   if (f[i]>ans)
    ans = f[i];

  cout<<ans<<endl;
}

