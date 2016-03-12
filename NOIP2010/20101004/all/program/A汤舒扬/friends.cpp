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

ifstream fin ("friends.in" );
ofstream fout("friends.out");

int n;

int main() {
	fin >>n;
	for(int i=1;i<=n;++i)
		fout <<"almost friends" <<endl;
	return 0;
}
