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

ifstream fin ("sugar.in" );
ofstream fout("sugar.out");

int n;

int main() {
	fin >>n;
	++n;
	fout << ( ( (long long)(n+1) * (long long)n ) >> 1 ) <<endl;
	return 0;
}
