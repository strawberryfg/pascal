#include <iostream.h>
#include <iomanip.h>
void main()
{int bound=1,m,n,i,j,b,p,gr[15];
 cout<<"Input n,m:"<<endl; 
 cin>>n>>m;
 for(i=1;i<=n;i++) bound=bound*2 ;
 if(m<0||m>=bound)
   {cout<<"Data error!"<<endl;
    return ;
   }
 b=1;
 for(i=1;i<=n;i++)
  {p=0; b=b*2;
   for(j=0 ;j<=m;j++)
     if( (j%b-(b/2))==0 )
      p=1-p;
   gr[i]=p;
  }
 for(i=n;i>=1;i--)
   cout<<setw(1)<<gr[i];
 cout<<endl;
}

