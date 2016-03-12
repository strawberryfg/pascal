#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define MAXN 10
#define MAXM 10
#define MAX MAXN*MAXM

FILE *fin, *fout;
int board[MAXN][MAXM], route[MAX];
int n, m, sx, sy;

const
int delt[8][2] = {{1, -2}, {2, -1}, {2, 1}, {1, 2}, {-1, 2}, {-2, 1}, {-2, -1}, {-1, -2}};

int search(int step, int x, int y) {
  int i, x1, y1;
  if (board[x][y] != 0) return 0;
  board[x][y] = 1;
  route[step] = (x + 1) * 100 + y + 1;
  if (step == n * m - 1) {
    fprintf(fout, "(%d,%d)", route[0] / 100, route[0] % 100);
    for (i = 1; i < n * m; i++)
      fprintf(fout, "->(%d,%d)", route[i] / 100, route[i] % 100);
    fprintf(fout, "\n");
    return 1;
  }
  for (i = 0; i < 8; i++) {
    x1 = x + delt[i][0];
    y1 = y + delt[i][1];
    if ((x1 >= 0) && (x1 < n) && (y1 >= 0) && (y1 < m))
      if (search(step+1, x1, y1) == 1) return 1;
  }
  board[x][y] = 0;
  return 0;
}

int main() {
  fin = fopen("knight.in", "r");
  fout = fopen("knight.out", "w");
  fscanf(fin, "%d %d %d %d", &n, &m, &sx, &sy);
  memset(board, 0, sizeof(board));
  if (search(0, sx - 1, sy - 1) == 0)
    fprintf(fout, "No Answer!\n");
  fclose(fout);
  return 0;
}
