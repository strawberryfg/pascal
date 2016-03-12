#include <fstream.h>

ifstream fin("d.in");

const int MAX = 1000+5;

int up, l, n, w[MAX], s[MAX];
double st[MAX];

main() {
   cout.precision(1);
   cout.setf(ios::fixed, ios::floatfield);

   fin >> up >> l >> n;
   int i, j;
   for (i = 1; i <= n; i++) {
      fin >> w[i] >> s[i];
      st[i] = 1e30;
   }
   st[0] = 0;

   for (i = 1; i <= n; i++) {
      long long noww = w[i], nows = s[i];
      for (j = i - 1; j >= 0; j--) {
         if (noww > up) break;
         if (st[i] > l * 1.0 / nows + st[j])
            st[i] = l * 1.0 / nows + st[j];
         noww += w[j];
         if (s[j] < nows) nows = s[j];
      }
   }

   cout << st[n] * 60 << endl;

   return 0;
}