#include<iostream>
#include<fstream>
#include<cstdio>
#include<cstring>
#include<cstdlib>
#include<string>
#include<cmath>
#include<algorithm>
#include<vector>
using namespace std;

ifstream fin ("seq.in" );
ofstream fout("seq.out");

int n,w[1000000],ans=0,a[1000000];

int main() {
	int i;
	fin >>n;
	for(i=1;i<=n;++i)
		fin >>w[i];
	for(int aa=-40000;aa<=40000;aa++) {
		a[0]=aa;
		for(i=1;i<=n;++i) {
			a[i] = ( w[i] << 1 ) - a[i-1] ;
			if( a[i-1] > a[i] ) break;
		}
		if( i > n ) ans++;
	}
	fout <<ans <<endl;
	return 0;
}
