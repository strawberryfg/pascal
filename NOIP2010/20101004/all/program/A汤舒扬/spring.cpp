#include<iostream>
#include<fstream>
#include<cstdio>
#include<cstdlib>
#include<cstring>
#include<string>
#include<cmath>
#include<algorithm>
#include<vector>
#include<queue>
#include<stack>
#include<map>
#include<set>
#include<deque>
#include<list>
#include<cassert>
#include<ctime>
#include<cctype>
#include<cfloat>
using namespace std;

ifstream fin ("spring.in" ) ;
ofstream fout("spring.out") ;

int n,a[100][100],ans=0;
bool done[100];
#define MS(S) memset(S,0,sizeof(S))

int main() {
	fin >>n;
	for(int i=1;i<=n;++i)
		for(int j=1;j<=n;++j)
			fin >>a[i][j];
	MS(done);
	for(int i=1;i<=n;++i) {
		if(done[i]) continue;
		int pos= (i==1) ?(2) :(i-1) ;
		for(int j=1;j<=n;++j)
			if( j!=i && a[i][pos] > a[i][j] )
				pos=j;
		ans += a[i][pos] ;
		done[i] = done[pos] = true ;
	}
	fout <<ans <<endl;
	return 0;
}
