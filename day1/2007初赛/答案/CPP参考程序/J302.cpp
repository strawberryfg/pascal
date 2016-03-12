#include <iostream.h>
void fun(int *a,int *b)
{int *k;
 k=a;a=b;b=k;
}
void main( )
{int a=3,b=6,*x=&a,*y=&b;
 fun(x,y);
 cout<<a<<","<<b<<endl;
}
