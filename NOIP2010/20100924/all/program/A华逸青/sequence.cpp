#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <iostream>
#define LL long long
using namespace std;

FILE *fin = fopen("sequence.in", "r");
FILE *fout = fopen("sequence.out", "w");

const long maxn = 100010;

long q[maxn], n;
LL c, ansl, ansr, pc;

int main()
{
    fscanf(fin, "%ld\n", &n);
    for (long i = 1; i <= n; i ++) fscanf(fin, "%ld\n", &q[i]);
    c = 0; ansl = -2 * q[n]; ansr = q[1];
    for (long i = 1; i <= n; i ++)
    {
        pc = c;
        c = q[i] * 2 - c;
        if (i % 2 == 1)
           if ((c - pc) / 2 < ansr) ansr = (c - pc) / 2; else;
        else
           if ((pc - c) / 2 > ansl) ansl = (pc - c) / 2; else;
    }
    if (ansr >= ansl) fprintf(fout, "%I64d\n", ansr - ansl + 1); else fprintf(fout, "0\n");
    fclose(fin);
    fclose(fout);
}
