/*
ID		:	linyufly1
PROG		:	lineupg
LANG		:	C++
*/

/*
Program		:	Balanced Lineup
Author		:	Chen Mingcheng
*/

#include <cstdio>

const int maxn = 50000;
const int maxh = 20;

int opt1[maxh][maxn], opt2[maxh][maxn];		//	1 : Max, 2 : Min
int n, q;

inline int Max(int a, int b) {
	return a > b ? a : b;
}

inline int Min(int a, int b) {
	return a < b ? a : b;
}

void Init() {
	freopen("lineupg.in", "r", stdin);
	freopen("lineupg.out", "w", stdout);
	scanf("%d %d", &n, &q);
	int i, x, len, h;
	for (i = 0; i < n; i++) {
		scanf("%d", &x);
		opt1[0][i] = opt2[0][i] = x;
	}
	for (len = 1, h = 1; (len << 1) <= n; len <<= 1, h++)
		for (i = 0; i + (len << 1) <= n; i++) {
			opt1[h][i] = Max(opt1[h - 1][i], opt1[h - 1][i + len]);
			opt2[h][i] = Min(opt2[h - 1][i], opt2[h - 1][i + len]);
		}
}

inline int Ask(int a, int b) {
	int j = 0, l = 1, len = b++ - a + 1 >> 1;
	for (; l <= len; j++, l <<= 1);
	return Max(opt1[j][a], opt1[j][b - l]) - Min(opt2[j][a], opt2[j][b - l]);
}

void Work() {
	int a, b;
	while (q--) {
		scanf("%d %d", &a, &b);
		a--;
		b--;
		printf("%d\n", Ask(a, b));
	}
	fclose(stdin);
	fclose(stdout);
}

int main() {
	Init();
	Work();
	return 0;
}
