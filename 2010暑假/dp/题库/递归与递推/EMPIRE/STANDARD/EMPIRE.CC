/*
Jiangsu Olympiad in Informatics
Training Problem
Standard Program

Task:            King & Prince
Author:          Rezaul Alam Chowdhury(adapt by Wenyuan Dai)
Algorithm:       Recursion
Complex:         O(n^3)
Code:            Wenyuan Dai
Date:            3-23-2002
Time Limit:      1 second(Pentium IV 1.5G & 128MB RAM)
*/
#include <fstream.h>
#include <string.h>

ifstream fin("empire.in");
ofstream fout("empire.out");

const int MAX = 100+10;

int st[MAX][MAX << 1][MAX << 1];

int msearch(int n, int w, int k) {
  if (!n) {
    if (k) return 0;
    return 1;
  }
  if (k >= (MAX << 1) || k >= n << 1) return 0;
  if (st[n][w][k] >= 0) return st[n][w][k];

  int tot = w * msearch(n - 1, w + 1, k - 1);
  if (n > 1) tot += tot;
  tot += msearch(n - 1, w + 2, k);
  if (w >= 2)
    tot = (tot + w * (w - 1) * msearch(n - 1, w, k - 2));

  return st[n][w][k] = tot % 504;
}

main() {
  int n, k;
  fin >> n >> k;
  
  memset(st, 0xFF, sizeof(st));
  fout << msearch(n, 1, k) << endl;
  
  return 0;
}
