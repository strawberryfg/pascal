#include <stdio.h>
void fun(int *a,int *b)
{int *k;
 k=a;a=b;b=k;
}
main( )
{int a=3,b=6,*x=&a,*y=&b;
 fun(x,y);
 printf("No.1: %d,%d ",a,b);
 fun(&a,&b);
 printf("No.2: %d,%d\n",a,b);
}

