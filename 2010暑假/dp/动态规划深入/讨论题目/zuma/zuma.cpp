#include <stdio.h>
#include <string.h>

#define MAX (500+5)

int n, a[MAX];
int m, b[MAX][2];

int st[MAX][MAX];

int dfs(int l, int r) {
	if (l == r) return (b[l][1] == 1 ? 2 : 1);
	if (st[l][r] >= 0) return st[l][r];
		
	int min = 2147483647;
	
	if (b[l][0] == b[r][0]) {
		int now = dfs(l + 1, r - 1) + (b[l][1] + b[r][1] < 3);
		if (now < min) min = now;	
	}
	
	int i;
	for (i = l; i < r; i++) {
		int now = dfs(l, i) + dfs(i + 1, r);
		if (now < min) min = now;		
	}
	
	return st[l][r] = min;	
}

main() {
	freopen("zuma.in", "r", stdin);
	
	scanf("%d", &n);
	
	int i;
	for (i = 0; i < n; i++)
		scanf("%d", &a[i]);
		
	for (m = i = 0; i < n; i++)
		if (i == 0 || a[i] != a[i - 1])
			b[m][0] = a[i], b[m][1] = 1, m++;
		else 
			b[m - 1][1]++;
			
	memset(st, 0xFF, sizeof(st));
	
	printf("%d\n", dfs(0, m - 1));
	
	return 0;	
}
