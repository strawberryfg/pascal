#include <stdio.h>
main()
{int bound=1,m,n,i,j,b,p,gr[15];
 printf("input n,m\n");
 scanf("%d%d",&n,&m);
 for(i=1;i<=n;i++) bound=bound*2 ;
 if(m<0||m>=bound)
   {printf("Data error!\n");
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
  printf("%1d",gr[i]);
 printf("\n");
}
