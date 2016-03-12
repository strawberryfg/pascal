#include <cstdio>
#include <cstring>
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

FILE* fin = fopen("divide.in", "r");
FILE* fout = fopen("divide.out", "w");

const int MaxN = 10005;
const long long oo = (long long)1 << 60;

int n, k, c, a[MaxN];
long long dp[MaxN];

inline long long sqr(int a)
{
    return (long long)a * a;
}

void Init()
{
    fscanf(fin, "%d%d%d", &n, &k, &c);
    for (int i = 1; i <= n; ++i)
        fscanf(fin, "%d", a + i);
}

void Work()
{
    sort(a, a + n);
    dp[0] = 0;
    for (int i = 1; i <= n; ++i)
    {
        dp[i] = oo;
        for (int j = i - k; j >= 0; --j)
            dp[i] = min(dp[i], dp[j] + c + sqr(a[i] - a[j + 1]));
    }
    fprintf(fout, "%I64d\n", dp[n]);
}

int main()
{
    Init();
    Work();
    return 0;
}
