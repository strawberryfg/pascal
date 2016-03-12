




/*
  Program   :   Sequence
  Author    :   yk
  Date      :   24-09-10
  Algorithm :   
*/

#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cmath>
#include <iterator>
using namespace std;

const int maxn = 100000 + 5;
const int inf  = 0x7fffffff;

int n, s = inf;
int c[maxn];

int main () {
    freopen ("seq.in" , "r", stdin );
    freopen ("seq.out", "w", stdout);
    
    scanf ("%d", &n);
    for (int i = 1; i <= n; ++ i) {
        scanf ("%d", c + i);
        if (i > 1) s = min (s, c[i] - c[i - 1]);
    }
    printf ("%d\n", s + 1);
    
    return 0;
}
