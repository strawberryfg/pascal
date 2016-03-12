#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <cassert>

using namespace std;

int L,pos[102];
int s,t,m,end; //end--a[]的个数
int n;
int dis;
int a[50000];
int cmp(const void *w1,const void *w2) {
	if (*(int *)w1-*(int *)w2>0) return 1;
	if (*(int *)w1-*(int *)w2<0) return -1;
	return 0;
}
void work(int i) {
	int j,k,d,tnum;
	if (pos[i+1]-pos[i]>=dis) { //-1不能少
		tnum=10000;
		for (k=1;k<=t;k++) if (tnum>a[end-k]) tnum=a[end-k];
		for (j=1;j<t;j++) a[end++]=tnum;
		a[end++]=tnum+1;
	}
	else {
		d=pos[i+1]-pos[i]-1; //加d个'0'
		for (j=0;j<d;j++) {
			a[end]=10000;
			for (k=end-t;k<=end-s;k++) if (a[end]>a[k]) a[end]=a[k];
			end++;
		}
		a[end]=10000;
		for (k=end-t;k<=end-s;k++) if (a[end]>a[k]+1) a[end]=a[k]+1;
		end++;
	}
}
int main() {
	int i,num;
	freopen("river.in", "r", stdin);
	freopen("river.out", "w", stdout);
	cin >> L;
	cin >> s >> t >> m;
	pos[0]=0;pos[m+1]=L; //把起始点也放一个石子，便于计算，最后把它减掉
	for (i=1;i<=m;i++) cin >> pos[i]; //1,...,m----存位置
	{char c; assert(!(cin >> c));}
	qsort(pos,m+1,sizeof(int),cmp);
	if (t!=s) { //确定dis, 分t==s和t!=s讨论，dis=n*t, n>=(t-1)/(t-s)
		if ((s-1)%(t-s)==0) n=(t-1)/(t-s);
		else n=(t-1)/(t-s)+1;
		dis=n*t;//printf("dis: %d\n",dis);
		for (end=0;end<t;end++) a[end]=0;
		//a[0]--L+t-1, a[t-1]--L 位置以后的最少石子数
		for (i=m;i>=0;i--) work(i);
		printf("%d\n",a[end-1]-1);
	}
	else { //t==s
		num=0;
		for (i=1;i<=m;i++) if (pos[i]%t==0) num++;
		printf("%d\n",num);
	}
	fclose(stdin);
	fclose(stdout);
	return 0;
}
