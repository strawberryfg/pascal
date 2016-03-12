#include <iostream.h>
#define NN 20
#define maxint 30000
#define maxl 500
int n,m,bestx[NN],x[NN],y[maxl],maxvalue=0;
void result()
{int j;
 cout<<"r="<<maxvalue<<endl;
 for(j=1;j<=n;j++)
   cout<<bestx[j]<<" ";
 cout <<endl;
}

void backtrace(int i,int r)
{ int j,k,z[maxl];
 for(j=0;j<= x[i-2]*(m-1) ;j++)
   if(y[j]<m)
     for(k=1;k<=m-y[j];k++)
      if(y[j]+k<=y[j+x[i-1]*k ])
        y[ j+x[i-1]*k ]=y[j]+k;
 	  while(y[r]<maxint) r++;
 if(i>n)
  {if(r-1>maxvalue)
   {maxvalue=r-1 ;
    for(j=1;j<=n;j++) bestx[j]=x[j];
   }
   return;
  }
 for(k=0;k<maxl;k++)
    z[k]=y[k];
 for(j=x[i-1]+1 ;j<=r;j++)
  {x[i]=j;
   backtrace(i+1,r);
   for(k=0;k<maxl;k++)
   y[k]=z[k];
  }
}

void main()
{int j;
 cout<<"input n,m:"<<endl;  cin >>n>>m;
 for(j=1;j<maxl;j++)
   y[j]=maxint;
 y[0]=0;  x[0]=0; x[1]=1;
 backtrace(2,1);
 result();
}

