#include <stdio.h>
#include <fstream>
#include <iostream>

using namespace std;
ifstream fin("comfort.in");
ofstream fout("comfort.out");

int d[1010] ;
int N,M,Z;

bool check(int k)
{
   int i;
   for (i=1; ; )
	{
	   if (d[i]==k || d[i]==-1 ) return false;
	   if (i==Z) return true;
	   d[i]=k;
	   i+=k;
	   if (i>N) i=i-N;
	}
}

int main(int argc, char *argv[])
{
   fin>>N>>Z>>M;
   for (int i=0; i<M; ++i )
	{
	   int x; fin>>x;
	   d[x]=-1;
	}
   for (int i=1; i<=N; ++i )
	   if (check(i) ) { fout<<i<<endl; return 0; }

	return 0;
}
