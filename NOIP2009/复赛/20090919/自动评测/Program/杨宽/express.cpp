




/*
  Program   :   Express
  Language  :   C++
  Author    :   czsms_yk
  Date      :   19-09-09
*/

#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <queue>
using namespace std;

int T, A, k, B, z;
int f, t, h[10010], c[10010];
bool p[10010];

struct node {
       int d, s;
       node :: node (int _d, int _s) {d = _d; s = _s;}
};

bool operator < (const node &p, const node &q) {
     return p.s > q.s;
}

inline int calc (int x, int y) {
    int sumc = 0, minc = 10, maxc = 0;
    while (x) {
          sumc += x % 10;
          x /= 10;
    }
    while (y) {
          minc <?= y % 10;
          maxc >?= y % 10;
          y /= 10;
    }
    return sumc * maxc + minc;
}

int main () {
    freopen ("express.in" , "r", stdin );
    freopen ("express.out", "w", stdout);
    
    scanf ("%d", &T);
    for (int i = 1; i <= T; i ++) {
        scanf ("%d %d", &A, &k);
        memset (h, 0, sizeof (h));
        memset (c, 3, sizeof (c));
        memset (p, 1, sizeof (p));
        if (A == k) {
           printf ("0\n");
           continue;
        }
        priority_queue <node> Q;
        while (!Q.empty ()) Q.pop ();
        Q.push (node (A, 0));
        f = 1; t = 1;
        while (f <= t) {
              if (Q.empty ()) {
                 f = t + 1;
                 break;
              }
              int r = Q.top ().d;
              Q.pop ();
              if (r == k) {
                 printf ("%d\n", c[k]);
                 break;
              }
              if (r > 10000 || p[r]) {
                 h[f] = r;
                 for (int i = 1; i <= f; i ++) {
                     B = calc (h[i], h[f]);
                     z = 1;
                     if (h[i] != A) z += c[h[i]];
                     if (h[f] != A) z += c[h[f]];   
                     if (c[B] > z) {
                        t ++;
                        c[B] = z;
                        Q.push (node (B, z));
                     }
                     B = calc (h[f], h[i]);
                     z = 1;
                     if (h[i] != A) z += c[h[i]];
                     if (h[f] != A) z += c[h[f]];   
                     if (c[B] > z) {
                        t ++;
                        c[B] = z;
                        Q.push (node (B, z));
                     }
                 }
                 if (r < 10000) p[r] = false;
                 f ++;
              }
        }
        if (f > t) printf ("-1\n");
    }
    
    return 0;
}
