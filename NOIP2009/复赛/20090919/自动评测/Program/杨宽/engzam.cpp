




/*
  Program   :   Engzam
  Language  :   C++
  Author    :   czsms_yk
  Date      :   19-09-09
*/

#include <iostream>
#include <cstdio>
#include <cstdlib>
using namespace std;

int n, m, k, ret;
char c[10010][101], h[101], q;
int p[10010];

bool prev (int r) {
     if (strlen (c[r]) < strlen (h)) return false;
     for (int i = 0; i < strlen (h); i ++)
         if (c[r][i] != h[i]) return false;
     return true;
}

int main () {
    freopen ("engzam.in" , "r", stdin );
    freopen ("engzam.out", "w", stdout);
    
    scanf ("%d %d", &n, &m);
    for (int i = 1; i <= n; i ++) {
        scanf ("%c", &q);
        cin >> c[i];
        scanf ("%d", &p[i]);
    }
    for (int i = 1; i <= m; i ++) {
        scanf ("%c", &q);
        cin >> h;
        scanf ("%d", &k);
        ret = 0;
        for (int j = 1; j <= n; j ++) 
            if (prev (j) && p[j] >= k) ret ++;
        printf ("%d\n", ret);
    }
    
    return 0;
}
