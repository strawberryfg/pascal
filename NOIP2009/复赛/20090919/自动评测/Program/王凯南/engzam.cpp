#include <cstdio>
#include <cstring>
#include <iostream>
#include <algorithm>
#include <vector>
using namespace std;

FILE* fin = fopen("engzam.in", "r");
FILE* fout = fopen("engzam.out", "w");

const int MaxN =  100001;
const int MaxL = 12;

int n, m;
char s[MaxL];

typedef struct WordTree* Tree; 
struct WordTree
{
    Tree a[26];
    vector<int> f;
    WordTree()
    {
        memset(a, 0, sizeof(a));
        f.clear();
    }
    void insert(char* s, int _cnt)
    {
        int p = *s - 'a';
        f.push_back(_cnt);
        if (!*s) return;
        if (!a[p]) a[p] = new WordTree;
        a[p]->insert(s + 1, _cnt);
    }
    void set()
    {
        sort(f.begin(), f.end());
        for (int i = 0; i < 26; ++i)
            if (a[i]) a[i]->set();
    }
    void go(char * s, int l)
    {
        if (!*s)
        {
            int ans = lower_bound(f.begin(), f.end(), l) - f.begin();
            ans = f.size() - ans;
            fprintf(fout, "%d\n", ans);
            return;
        }
        int p = *s - 'a';
        if (a[p]) a[p]->go(s + 1, l);
            else
            {
                fprintf(fout, "0\n");
                return;
            }
    }
}T;

void Init()
{
    fscanf(fin, "%d%d", &n, &m);
    for (int i = 0; i < n; ++i)
    {
        int p;
        fscanf(fin, "%s%d", s, &p);
        T.insert(s, p);
    }
}

void Work()
{
    T.set();
    for (int i = 0; i < m; ++i)
    {
        int l;
        fscanf(fin, "%s%d", s, &l);
        T.go(s, l);
    }  
}

int main()
{
    Init();
    Work();
    //system("pause");
    return 0;
}
