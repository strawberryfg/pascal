#include <cstdio>
#include <cstring>
#include <iostream>
#include <algorithm>
#include <vector>
#include <map>
#include <queue>
using namespace std;

FILE* fin = fopen("express.in", "r");
FILE* fout = fopen("express.out", "w");

const int MaxN = 10000;

int F, T;
vector <pair<int, int> > a;
priority_queue <pair<int, int> > Q;
bool vst[MaxN];

int calcu(int x, int y)
{
    int sum = 0, max = -1, min = 10;
    while (x)
    {
        int t = x % 10;
        sum += t;
        x /= 10;
    }
    if (!y) max = min = 0;
    while (y)
    {
        int t = y % 10;
        max >?= t;
        min <?= t;
        y /= 10;
    }
    return sum * max + min;
}

void Init()
{
    fscanf(fin, "%d%d", &F, &T);
}

void Work()
{
    a.clear();
    while (!Q.empty()) Q.pop();
    memset(vst, 0, sizeof(vst));
    
    Q.push(make_pair(0, F));
    while (!Q.empty())
    {
        pair<int, int> t = Q.top();
        Q.pop();
        int from = t.second;
        int D = t.first;
        if (vst[from]) continue;
        vst[from] = 1;
        a.push_back(t);
        if (from == T)
        {
            fprintf(fout, "%d\n", -D);
            return;
        }
        for (int i = 0; i < a.size(); ++i)
        {
            int to = calcu(from, a[i].second);
            int dto = D + a[i].first - 1;
            if (!vst[to]) Q.push(make_pair(dto, to));
            to = calcu(a[i].second, from);
            if (!vst[to]) Q.push(make_pair(dto, to));
        }
    }    
    fprintf(fout, "-1\n");
}

int main()
{
    int T;
    for (fscanf(fin, "%d", &T); T; T--)
    {
        Init();
        Work();
    }
    return 0;
}
