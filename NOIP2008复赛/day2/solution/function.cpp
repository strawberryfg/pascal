#include <stdio.h>
#include <fstream>
#include <iostream>

using namespace std;
ifstream fin("function.in");
ofstream fout("function.out");

int  w[21][21][21];
bool bb[21][21][21];

int f(int a,int b,int c)
{
   if (a<=0 || b<=0 || c<=0 ) return 1;
   if (a>20 || b>20 || c>20 ) return f(20,20,20);
   if (bb[a][b][c] ) return w[a][b][c];
   if (a<b && b<c) w[a][b][c] =  f(a,b,c-1)+f(a,b-1,c-1)-f(a,b-1,c);
   else w[a][b][c] =f(a-1,b,c)+f(a-1,b-1,c)+f(a-1,b,c-1)-f(a-1,b-1,c-1);
   bb[a][b][c]=true;
   return w[a][b][c];
}

int main( )
{
	int a,b,c;
    fin>>a>>b>>c;
	fout<<"w("<<a<<", "<<b<<", "<<c<<") = "<<f(a,b,c);

	return 0;
}
