#include <cstdio>
#include <iostream>
#include <algorithm>

using namespace std;

FILE* fin = fopen("bag.in", "r");
FILE* fout = fopen("bag.out", "w");

const int MaxN = 1000001;

int n;
int *f[MaxN];

void Init()
{
    fscanf(fin, "%d", &n);
}

void Work()
{
    f[0] = new int[16];
    for (int i = 0; i < 16; ++i)
        f[0][i] = 0;
    f[0][15] = 1;
    for (int i = 0; i < n; ++i)
    {
        f[i + 1] = new int[16];
        for (int j = 0; j < 16; ++j)
        {
            f[i + 1][j] = 0;
            f[i][j] %= 997;
        }
        for (int j = 0; j < 16; ++j)
        {
            //printf("%d ", f[i][j]);
            f[i + 1][j ^ 15] += f[i][j];
            for (int k = 1; k < 8; k <<= 1)
                if ((j & k * 3) == k * 3)
                f[i + 1][(j ^ 15) + k * 3] += f[i][j];
        }
        f[i + 1][15] += f[i][15];
        //printf("\n");
        delete []f[i];
    }
    fprintf(fout, "%d\n", f[n][15] % 997);
}

int main()
{
    Init();
    Work();
    //system("pause");
    return 0;
}
