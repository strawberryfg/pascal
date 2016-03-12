// Program : concert

#include<iostream>
#include<cstdio>
#include<cstdlib>
#include<cstring>
using namespace std;

const int INF = 1000000000;
int a[301], b[301], f[301][301], sumb[301], suma[301];

int main()
{
    freopen("concert.in", "r", stdin);
    freopen("concert.out", "w", stdout);
    
    int n, i, j, k, ans, l;
    scanf("%d", &n);
    suma[0] = 0;
    for (i = 1; i <= n; i ++)
    {
        scanf("%d", &a[i]);
        suma[i] = suma[i - 1] + a[i];
    }
    
    sumb[0] = 0;
    for (i = 1; i <= n; i ++)
    {
        scanf("%d", &b[i]);
        sumb[i] = sumb[i - 1] + b[i];
    }
    
    memset(f, 0, sizeof(f));
    f[0][0] = 0;
    for (i = 1; i <= n; i ++) f[i][0] = -suma[i] * suma[i], f[0][i] = -sumb[i] * sumb[i];
    ans = -INF;
    for (i = 1; i <= n; i ++)
    {
        f[i][1] = a[i] * b[1] - suma[i - 1] * suma[i - 1] - (sumb[n] - sumb[1]) * (sumb[n] - sumb[1]), f[1][i] = a[1] * b[i] - sumb[i - 1]* sumb[i - 1];
        if (f[i][1] > ans) ans = f[i][1];
        if (f[1][i] > ans) ans = f[1][i];
    }
    for (i = 2; i <= n; i ++)
    {
        for (j = 2; j <= n; j ++)
        {
            f[i][j] = -INF;
            for (k = 1; k <= i - 1; k ++)
            {
                for (l = 1; l <= j - 1; l ++)
                {
                    f[i][j] = max(f[i][j], f[k][l] + a[i] * b[j] - (suma[i - 1] - suma[k]) * (suma[i - 1] - suma[k]) - (sumb[j - 1] - sumb[l]) * (sumb[j - 1] - sumb[l]));
                }
            }
            f[i][j] = max(f[i][j], a[i] * b[j] - suma[i - 1] * suma[i - 1] - sumb[j - 1] * sumb[j - 1]);
            if (f[i][j] > ans) ans = f[i][j];
        }
    }
    printf("%d\n", ans);
    return 0;
}
