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

typedef struct node {
	int L,R,Mid;
	int sigma,delta,minnum,val;
	node *lc, *rc;
} *tree;

#define MS(S) memset(S,0,sizeof(S))
#define oo (0x2fffffff)

int n,m,I,ans=0;
tree root,nil;

void newit(const tree &t) {
	if(t->delta) {
		t->sigma += t->delta * ( t->R - t->L +1 ) ;
		t->minnum += t->delta ;
		t->lc->delta += t->delta ;
		t->rc->delta += t->delta ;
		t->delta=0;
	}
	if( t->val < oo ) {
		t->lc->val = t->rc->val = t->val ;
		t->minnum = t->val ;
		t->sigma = (t->val)*( t->R - t->L +1 );
		t->val = oo ;
	}
}

void create(tree &t,int lj,int rj,const int init) {
	t=new node;
	t->L=lj; t->R=rj;
	t->Mid = (lj+rj)>>1 ;
	t->sigma = (rj-lj+1)*init;
	t->delta=0;
	t->minnum=init;
	t->val = oo ;
	if(lj==rj)
		t->lc = t->rc = nil ;
	else {
		create(t->lc,lj,t->Mid,init);
		create(t->rc,t->Mid+1,rj,init);
	}
}

bool query(tree t,int lj,int rj) {
	newit(t);
	//cout <<t->L <<' '<<t->R<<" " <<(t->minnum>0)<<endl;
	bool f=true;
	if( lj <= t->L && t->R <= rj )
		return ( t->minnum > 0 ) ;
	else {
		if( lj <= t->Mid )
			f = f && query(t->lc,lj,rj) ;
		if( t->Mid < rj )
			f = f && query(t->rc,lj,rj) ;
	}
	newit(t->lc); newit(t->rc);
	t->minnum = min( t->lc->minnum , t->rc->minnum );
	t->sigma = t->lc->sigma + t->rc->sigma ;
	return f;
}

void add(tree t,int lj,int rj,const int &dt) {
	newit(t);
	if( lj <= t->L && t->R <= rj ) {
		t->sigma += dt * ( t->R - t->L +1 ) ;
		t->minnum += dt ;
		t->lc->delta += dt ;
		t->rc->delta += dt ;
		return;
	}
	if( lj <= t->Mid )
		add( t->lc, lj, rj, dt );
	if( t->Mid < rj )
		add( t->rc, lj, rj, dt );
	newit(t->lc); newit(t->rc);
	t->minnum = min( t->lc->minnum , t->rc->minnum );
	t->sigma = t->lc->sigma + t->rc->sigma ;
}

void cover(tree t,int lj,int rj,int dt) {
	newit(t);
	if( lj <= t->L && t->R <= rj ) {
		t->lc->val = t->rc->val = dt ;
		t->minnum = dt ;
		t->sigma = dt * ( t->R - t->L +1 );
		return;
	}
	if( lj <= t->Mid )
		cover( t->lc, lj, rj, dt );
	if( t->Mid < rj )
		cover( t->rc, lj, rj, dt );
	newit(t->lc); newit(t->rc);
	t->minnum = min( t->lc->minnum , t->rc->minnum );
	t->sigma = t->lc->sigma + t->rc->sigma ;
}

void travel(tree t) {
	cout <<"----------"<<endl;
	cout <<t->L <<' ' <<t->R <<' ' <<t->Mid <<endl;
	cout <<"sigma:  " <<t->sigma <<endl;
	cout <<"delta:  " <<t->delta <<endl;
	cout <<"minnum:  " <<t->minnum <<endl;
	cout <<"val:  " <<t->val <<endl;
	cout <<"----------" <<endl;
	if(t->lc!=nil) travel(t->lc);
	if(t->rc!=nil) travel(t->rc);
}

int main() {
	nil=new node;
	nil->lc = nil->rc = nil ;
	root=nil;
	freopen("highway.in","r",stdin);
	freopen("highway.out","w",stdout);
	cin >>n >>m >>I;
	create(root,1,n,I);
//	travel(root);
	int stat,s,t,p;
	while(m--) {
		scanf("%d%d%d%d",&stat,&s,&t,&p);
		if(stat==1) {
			if( query(root,s,t) ) {
				add(root,s,t,-p);
				++ans;//cout <<"*******"<<endl;
			}//travel(root);
		}
		if(stat==2)
			add(root,s,t,p);
		if(stat==3)
			cover(root,s,t,p);
	}
	cout <<ans <<endl;
	//system("pause");
	return 0;
}
