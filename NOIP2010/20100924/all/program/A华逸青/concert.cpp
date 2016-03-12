#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <cstring>
#include <cmath>

using namespace std;

FILE *fin = fopen("concert.in", "r");
FILE *fout = fopen("concert.out", "w");

const long maxn = 310;

long f[maxn][maxn], fv[maxn], mv[maxn], n, sf[maxn], sm[maxn], x;
long long ans;
bool flag, ff;

int main()
{
    fscanf(fin, "%ld\n", &n);
    memset(sf, 0, sizeof(sf)); memset(sm, 0, sizeof(sm)); ans = 0;
    memset(f, 0, sizeof(f));
    for (long i = 1; i <= n; i ++) 
        {fscanf(fin, "%ld\n", &fv[i]); sf[i] = sf[i - 1] + fv[i];}
    for (long i = 1; i <= n; i ++) 
        {fscanf(fin, "%ld\n", &mv[i]); sm[i] = sm[i - 1] + mv[i];}
    ff = false;
    for (long i = 1; i <= n; i ++)
    {
        for (long j = 1; j <= n; j ++)
        {
            f[i][j] = fv[i] * mv[j]; x = 0 - sm[j - 1] * sm[j - 1] - sf[i - 1] * sf[i - 1]; 
            for (long k = j - 1; k > 0; k --)
                if (f[i - 1][k] - (sm[j - 1] - sm[k]) * (sm[j - 1] - sm[k]) > x && i - 1 != 0)
                   {x = f[i - 1][k] - (sm[j - 1] - sm[k]) * (sm[j - 1] - sm[k]);}
            for (long k = i - 1; k > 0; k --)
                if (f[k][j - 1] - (sf[i - 1] - sf[k]) * (sf[i - 1] - sf[k]) > x && j - 1 != 0)
                   {x = f[k][j - 1] - (sf[i - 1] - sf[k]) * (sf[i - 1] - sf[k]);}
            f[i][j] += x;
            if ((long long)f[i][j] - (long long)(sf[n] - sf[i]) * (sf[n] - sf[i]) - 
                (long long)(sm[n] - sm[j]) * (sm[n] - sm[j]) > ans || !ff)
               {ans = (long long)f[i][j] - (long long)(sf[n] - sf[i]) * (sf[n] - sf[i]) - 
                (long long)(sm[n] - sm[j]) * (sm[n] - sm[j]); ff = true;} 
        }
    } 
    fprintf(fout, "%I64d\n", ans);
}
