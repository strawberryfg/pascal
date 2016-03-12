




/*
  Program   :   Escape
  Author    :   yk
  Date      :   24-09-10
  Algorithm :   Dynamic Programming
*/

#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <algorithm>
using namespace std;

const int maxn = 300 + 5;

struct node {
       int num, sum;
       node (int _num = 0, int _sum = 0) {num = _num; sum = _sum;}
} c[maxn];

bool cmp (const node &p, const node &q) {
     return (p.sum < q.sum);
}

int n, m, q;
int s[maxn], T[maxn][maxn], F[maxn][maxn][maxn];

void init () {
    scanf ("%d%d", &n, &m);
    for (int i = 1; i <= n; ++ i) {
        int tmp; scanf ("%d", &tmp);
        c[i] = node (i - 1, tmp);
    }
    sort (c + 1, c + n, cmp);
    
    memset (T, -1, sizeof (T));
    for (int i = 1; i <= n; ++ i)
        s[c[i].num] = i;
    for (int i = 1; i <= m; ++ i) {
        int x, y, z;
        scanf ("%d%d%d", &x, &y, &z);
        T[s[x]][s[y]] = T[s[y]][s[x]] = z;
    }
}

void floyd () {
     memset (F, 7, sizeof (F));
     for (int i = 1; i <= n; ++ i)
         for (int j = 1; j <= n; ++ j)
             F[0][i][j] = T[i][j];
     for (int k = 1; k <= n; ++ k)
         for (int i = 1; i <= n; ++ i)
             for (int j = 1; j <= n; ++ j) {
                 F[k][i][j] = F[k - 1][i][j];
                 int cc = F[k - 1][i][k] + F[k - 1][k][j];
                 if (F[k - 1][i][k] >= 0 && F[k - 1][k][j] >= 0) {
                    if (F[k][i][j] < 0 || F[k][i][j] > cc) F[k][i][j] = cc;
                 }
             }
}

void calc () {
     int u, v, w, l, r;
     scanf ("%d", &q);
     for (int i = 1; i <= q; ++ i) {
         scanf ("%d%d%d", &u, &v, &w);
         l = 1, r = n;
         while (l < r - 1) {
               int mid = (l + r) >> 1;
               if (c[mid].sum <= w) l = mid; else r = mid;
         }
         while (r >= 0 && c[r].sum > w) -- r;
         printf ("%d\n", F[r][s[u]][s[v]]);
     }
}

int main () {
    freopen ("escape.in" , "r", stdin );
    freopen ("escape.out", "w", stdout);
    
    init ();
    floyd ();
    calc ();
    
    return 0;
}
