




/*
  Program   :   Bag
  Language  :   C++
  Author    :   czsms_yk
  Date      :   19-09-09
*/

#include <iostream>
#include <cstdio>
#include <cstdlib>
using namespace std;

int T[16][6] = {{ 1, 15,  0,  0,  0,  0},
                { 1, 14,  0,  0,  0,  0},
                { 1, 13,  0,  0,  0,  0},
                { 2, 12, 15,  0,  0,  0},
                { 1, 11,  0,  0,  0,  0},
                { 1, 10,  0,  0,  0,  0},
                { 2,  9, 15,  0,  0,  0},
                { 3,  8, 11, 14,  0,  0},
                { 1,  7,  0,  0,  0,  0},
                { 1,  6,  0,  0,  0,  0},
                { 1,  5,  0,  0,  0,  0},
                { 2,  4,  7,  0,  0,  0},
                { 2,  3, 15,  0,  0,  0},
                { 2,  2, 14,  0,  0,  0},
                { 3,  1,  7, 13,  0,  0},
                { 5,  0,  3,  6, 12, 15}};
int n;
int f[2][16];

int main () {
    freopen ("bag.in" , "r", stdin );
    freopen ("bag.out", "w", stdout);
    
    scanf ("%d", &n);
    memset (f, 0, sizeof (f));
    f[0][15] = 1;
    for (int i = 1; i <= n; i ++) {
        int cur = i % 2, pre = 1 ^ cur;
        for (int j = 0; j <= 15; j ++) {
            f[cur][j] = 0;
            for (int k = 1; k <= T[j][0]; k ++)
                f[cur][j] += f[pre][T[j][k]];
            f[cur][j] %= 997;
        }
    }
    printf ("%d\n", f[n % 2][15]);
    
    return 0;
}
