#include <cstdio>
#include <cstdlib>
#include <cmath>
#include <cstring>
#include <iostream>

using namespace std;

FILE *fin = fopen("sugar.in", "r");
FILE *fout = fopen("sugar.out", "w");

long long ans, n;

long long findf(long long x)
{
     long long f, s;
     if (x == 0) return 1;
     s = x / 5 + 1;
     f = s;
     f += (x + x - (s - 1) * 5) * s / 4;
     return f;
} 

int main()
{
    fscanf(fin, "%I64d\n", &n);
    if (n >= 5)
       ans = findf(n) + (findf(n - 1) + findf(n - 2) + findf(n - 3) + findf(n - 4)) * 2 + findf(n - 5);
    else 
    {
       ans = findf(n);
       for (long i = n - 1; i >= 0; i --) 
           ans += findf((long long)i) * 2;
    }
    fprintf(fout, "%I64d\n", ans);
    fclose(fin);
    fclose(fout);
}
