#include<iostream>
#include<fstream>
#include<cstdio>
#include<cstring>
#include<cstdlib>
#include<string>
#include<cmath>
#include<algorithm>
using namespace std;

ifstream fin ("concert.in" );
ofstream fout("concert.out");

#define MAXN 1005
#define MS(S) memset(S,0,sizeof(S))
#define sqr(X) ((X)*(X))
int n,g[MAXN],b[MAXN],sigg[MAXN],sigb[MAXN];
int f[MAXN][MAXN];

int main() {
	fin >>n;
	MS(sigg); MS(sigb);
	for(int i=1;i<=n;++i) {
		fin >>g[i];
		sigg[i] = sigg[i-1]+g[i] ;
	}
	for(int i=1;i<=n;++i) {
		fin >>b[i];
		sigb[i] = sigb[i-1]+b[i] ;
	}
	MS(f);
	int p;
	for(int i=1;i<=n;++i)
		for(int j=1;j<=n;++j) {
			p=-(0x7FFFFFFF);
			for(int k1=0;k1<i;++k1)
				for(int k2=0;k2<j;++k2)
					p = max( p , f[k1][k2] +g[i]*b[j] 
					  -sqr( sigg[i-1] - sigg[k1] ) -sqr( sigb[j-1]-sigb[k2] ) );
			f[i][j]=p;
		}
	int ans=-(0x7FFFFFFF);
	for(int i=1;i<=n;++i)
		for(int j=1;j<=n;++j)
			ans = max( ans , f[i][j] - sqr( sigg[n]-sigg[i] ) - sqr( sigb[n]-sigg[j] ) );
	fout <<ans <<endl;
	return 0;
}
