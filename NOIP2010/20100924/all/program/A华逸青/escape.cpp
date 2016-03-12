#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <cstring>
#include <cmath>

using namespace std;

FILE *fin = fopen("escape.in", "r");
FILE *fout = fopen("escape.out", "w");

long ts[310], g[310][310][5], s[310], x, y, t, u, v, d[310], p, mm, mx, n, m, w;
bool f[310], ff;

int main()
{
    fscanf(fin, "%ld %ld\n", &n, &m);
    for (long i = 0; i < n; i ++) fscanf(fin, "%ld ", &ts[i]);
    memset(g, 0, sizeof(g)); memset(s, 0, sizeof(s));
    for (long i = 1; i <= m; i ++)
    {
        fscanf(fin, "%ld %ld %ld\n", &x, &y, &t);
        s[x] ++; g[x][s[x]][0] = y; g[x][s[x]][1] = t;
        s[y] ++; g[y][s[y]][0] = x; g[y][s[y]][1] = t;
    }
    fscanf(fin, "%ld\n", &p);
    for (long z = 1; z <= p; z ++)
    {
        fscanf(fin, "%ld %ld %ld\n", &u, &v, &w);
        memset(f, false, sizeof(f)); d[u] = 0; f[u] = true;
        mm = 0; mx = u; d[u] = -1;
        for (long i = 1; i <= n; i ++)
        {
            for (long j = 1; j <= s[mx]; j ++)
            {
                x = g[mx][j][0];
                if ((ts[x] <= w || x == v) && (!f[x] || (d[x] > mm + g[mx][j][1]) && d[x] != -1))
                   {f[x] = true; d[x] = mm + g[mx][j][1];}
            }
            ff = false;
            for (long j = 1; j <= n; j ++)
            {
                if (d[j] == -1) continue;
                if (!f[j]) continue;
                if (!ff || mm > d[j]) {ff = true; mm = d[j]; mx = j;}
            }
            if (mx == v) break;
            d[mx] = -1;
        }
        if (f[v]) fprintf(fout, "%ld\n", mm); else fprintf(fout, "-1\n");
    }    
    fclose(fin);
    fclose(fout);
}
