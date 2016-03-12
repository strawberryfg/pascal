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

FILE *fin =fopen("escape.in" ,"r"),
     *fout=fopen("escape.out","w");

#define oo (0x7FFFFFFF)
#define MAXN 305
typedef pair<int,int> pii;
#define mkp(X,Y) make_pair(X,Y)
#define MS(S) memset(S,0,sizeof(S))
int n,m,P,w,ans=+oo;
int ts[MAXN];
vector<pii> nxt[MAXN];
bool went[MAXN];

void search(int p,const int &tot,const int &b) {
	went[p]=true;
	if(p==b)
		ans = min( ans , tot );
	else
		for(int i=0;i<nxt[p].size();++i)
			if(  ! went[ nxt[p][i].first ]
			   &&( ts[ nxt[p][i].first ] <= w || nxt[p][i].first==b ) )
				search( nxt[p][i].first, tot+nxt[p][i].second, b );
	went[p]=false;
}

int main() {
	int a,b;
	fscanf(fin,"%d%d",&n,&m);
	for(int i=1;i<=n;++i)	
		fscanf(fin,"%d",&ts[i]);
	for(int i=1;i<=m;++i) {
		fscanf(fin,"%d%d%d",&a,&b,&w);
		a++; b++;
		nxt[a].push_back( mkp(b,w) );
		nxt[b].push_back( mkp(a,w) );
	}
	fscanf(fin,"%d",&P);
	while(P--) {
		fscanf(fin,"%d%d%d",&a,&b,&w);
		a++; b++;
		MS(went);
		went[a]=true;
		ans = +oo ;
		search(a,0,b);
		fprintf( fout, "%d\n", (ans==+oo) ?-1 :ans );
	}
	fclose(fin);
	fclose(fout);
	return 0;
}
