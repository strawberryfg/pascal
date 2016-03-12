// Program : sequence

#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<cstring>
using namespace std;

const int INF = 1000000000;

int sum[100001], b[100001];

int main()
{
    freopen("seq.in", "r", stdin);
    freopen("seq.out", "w", stdout);
    
    int n, i, j, l1, l2;
    scanf("%d", &n);
    j = 1;
    sum[0] = 0;
    for (i = 1; i <= n; i ++, j *= -1)
    {
        scanf("%d", &b[i]);
        sum[i] = sum[i - 1] + b[i] * j;
    }
    l1 = -INF, l2 = INF;
    
    for (i = 1, j = 1; i <= n; i ++, j *= -1)
    {
        if (j == -1) l1 = max(l1, -b[i] + 2 * sum[i - 1]);
        if (j == 1) l2 = min(l2, b[i] - 2 * sum[i - 1]); 
    }
    printf("%d\n", l2 - l1 + 1);
    return 0;
}
