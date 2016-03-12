




/*
  Program   :   Concert
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

int n;
int c[maxn][2], s[maxn][2], f[maxn][maxn];

int sqr (int t) {return t * t;}

int main () {
    freopen ("concert.in" , "r", stdin );
    freopen ("concert.out", "w", stdout);
    
    scanf ("%d", &n);
    memset (c, 0, sizeof (c));
    memset (s, 0, sizeof (s));
    memset (f, 0, sizeof (f));
    for (int i = 0; i <= 1; ++ i)
        for (int k = 1; k <= n; ++ k) {
            scanf ("%d", &c[k][i]);
            s[k][i] = s[k - 1][i] + c[k][i];
        }
    s[n + 1][0] = s[n][0]; s[n + 1][1] = s[n][1];
    for (int i = 1; i <= n + 1; ++ i)
        for (int j = 1; j <= n + 1; ++ j) {
            int tmp = c[i][0] * c[j][1];
            if (i == 1 || j == 1)
               f[i][j] = tmp - sqr (s[i - 1][0]) - sqr (s[j - 1][1]);
            else {
                 int maxc = 0x7fffffff + 1;
                 for (int k = 1; k < i; ++ k)
                     maxc = max (maxc, f[i - 1][k] - sqr (s[j - 1][1] - s[k][1]));
                 for (int k = 1; k < j; ++ k)
                     maxc = max (maxc, f[k][j - 1] - sqr (s[i - 1][0] - s[k][0]));
                 f[i][j] = maxc + tmp;
            }
        }
    printf ("%d\n", f[n + 1][n + 1]);
    
    return 0;
}
