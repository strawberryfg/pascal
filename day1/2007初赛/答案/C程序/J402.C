#include "stdio.h"
int board[65][65],tile;

void chessboard(int tr,int tc,int dr,int dc,int size)
{int t,s;
 if (size==1)
   return;
 t=tile++;
 s=size/2;
 if(dr<tr+s && dc<tc+s)
  chessboard(tr,tc,dr,dc,s);
 else
  {board[tr+s-1][tc+s-1]=t;
   chessboard(tr,tc,tr+s-1,tc+s-1,s);
  }
 if(dr<tr+s && dc>=tc+s)
  chessboard(tr,tc+s,dr,dc,s);
 else
  {board[tr+s-1][tc+s]=t;
   chessboard(tr,tc+s,tr+s-1,tc+s,s);
  }
 if(dr>=tr+s && dc<tc+s)
  chessboard(tr+s,tc,dr,dc,s);
 else
  {board[tr+s][tc+s-1]=t;
   chessboard(tr+s,tc,tr+s,tc+s-1,s);
  }
 if(dr>=tr+s && dc>=tc+s)
  chessboard(tr+s,tc+s,dr,dc,s);
 else
  {board[tr+s][tc+s]=t;
   chessboard(tr+s,tc+s,tr+s,tc+s,s);
  }
}

void prt1(int b[][65],int n)
{int i,j;
 for(i=1;i<=n;i++)
 {for(j=1;j<=n;j++)
   printf("%3d",b[i][j]);
  printf("\n");
 }
}
 int main()
 {int size,dr,dc;
  printf("input size(4/8/16/64):\n");
  scanf("%d",&size);
  printf("input the position of special block(x,y):\n");
  scanf("%d%d",&dr,&dc);
  board[dr][dc]=-1;
  tile++;
  chessboard(1,1,dr,dc,size);
  prt1(board,size);
}