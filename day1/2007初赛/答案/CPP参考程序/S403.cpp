#include <iostream.h>
#include <iomanip.h>
#include "math.h"
void main()
{int a1[51]={0};
 int i,j,t,t2,n=50;
 for (i=2;i<=sqrt(n);i++)
   if(a1[i]==0)
    {t2=n/i;
     for(j=2;j<=t2;j++) a1[i*j]=1;
    }
 t=0;
 for (i=2;i<=n;i++)
  if(a1[i]==0)
    {cout<<setw(4)<<i;  t++;
     if(t%10==0) cout<<endl;
    }
 cout<<endl;
}
