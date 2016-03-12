#include <stdio.h>
#include <stdlib.h>

#define MAXN 10
#define MAXM 10
#define MAX MAXN*MAXM

const
int delt[8][2] = {{1, -2}, {2, -1}, {2, 1}, {1, 2}, {-1, 2}, {-2, 1}, {-2, -1}, {-1, -2}};

int main() {
  int n, m, sx, sy;
  int x, y, top, i;
  int stack[MAX], board[MAXN][MAXM];
  FILE *fin, *fout;
  fin = fopen("knight.in", "r");
  fscanf(fin, "%d %d %d %d", &n, &m, &sx, &sy);
  fclose(fin);
  memset(board, 0, sizeof(board));
  x = sx - 1; y = sy - 1;
  board[x][y] = 1;
  top = 0;
  stack[top] = -1;
  while ((top >= 0) && (top < n * m - 1)) {
    stack[top]++;
    if (stack[top] < 8) {
      x = x + delt[stack[top]][0];
      y = y + delt[stack[top]][1];
      if ((x < 0) || (x >= n) || (y < 0) || (y >= m) || (board[x][y] == 1)) {
        x = x - delt[stack[top]][0];
        y = y - delt[stack[top]][1];
      }
      else {
        board[x][y] = 1;
        stack[++top] = -1;
      }
    }
    else {
      board[x][y] = 0;
      top--;
      x = x - delt[stack[top]][0];
      y = y - delt[stack[top]][1];
    }
  }
  fout = fopen("knight.out", "w");
  if (top > 0) {
    fprintf(fout, "(%d,%d)", sx, sy);
    for (i = 0; i < n * m - 1; i++) {
      sx = sx + delt[stack[i]][0];
      sy = sy + delt[stack[i]][1];
      fprintf(fout, "->(%d,%d)", sx, sy);
    }
    fprintf(fout, "\n");
  }
  else
    fprintf(fout, "No Answer!\n");
  fclose(fout);
  return 0;
}
