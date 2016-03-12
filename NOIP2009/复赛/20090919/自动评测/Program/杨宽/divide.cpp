




/*
  Program   :   Divide 
  Language  :   C++
  Author    :   czsms_yk
  Date      :   19-09-09
*/

#include <iostream>
#include <cstdio>
#include <cstdlib>
using namespace std;

int n, k, c;
long long B[10010], f[10010];

inline long long sqr (long long r) {
     return r * r;
}

int main () {
    freopen ("divide.in" , "r", stdin );
    freopen ("divide.out", "w", stdout);
    
    scanf ("%d %d %d", &n, &k, &c);
    for (int i = 1; i <= n; i ++) 
        scanf ("%d", &B[i]);
    sort (B, B + n + 1);
    memset (f, 0, sizeof (f));
    for (int i = k; i <= n; i ++) {
        f[i] = sqr (1 << 30);
        for (int j = i - k; j >= 0; j --) 
            f[i] <?= c + f[j] + sqr (B[i] - B[j + 1]);    
    }
    printf ("%d\n", f[n]);
    
    return 0;
}
