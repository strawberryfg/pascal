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

priority_queue< int , vector<int> , greater<int> > q;
set<int> st;
int n,k,p[1010];

int main() {
	freopen( "panda.in" , "r" , stdin  );
	freopen( "panda.out", "w" , stdout );
	cin >>n >>k;
	for(int i=1;i<=n;++i)
		scanf("%d",&p[i]);
	sort(p+1,p+n+1);
	q.push(1);
	st.insert(1);
	int tmp,t2;
	for(int i=0;i<=k;++i) {
		tmp = q.top() ; q.pop();
		for(int j=1;j<=n;++j) {
			t2=tmp*p[j];
			if(t2<=tmp) break;
			if( st.find(t2) == st.end() ) {
				q.push(t2);
				st.insert(t2);
			}
		}
	}
	cout <<tmp <<endl;
	return 0;
}
