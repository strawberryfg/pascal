var i,j:longint;
    a:array[1..9,1..9] of longint;
    h,l,board:array[1..9,1..9] of boolean;
function change(i,j:longint):longint;
var temp:longint;
begin
  temp:=(i-1) div 3*3+(j-1) div 3+1;
  change:=temp;
end;
procedure print;
var i,j:longint;
begin
  for i:=1 to 9 do
    begin
      for j:=1 to 8 do
        write(a[i][j],' ');
      writeln(a[i][9]);
    end;
  close(input);
  close(output);
  halt;
end;
procedure dfs(x,y:longint);
var i:longint;
begin
  if x=10 then print;
  if a[x][y]<>0 then
    if y<9 then dfs(x,y+1)
           else dfs(x+1,1)
  else
    begin
      for i:=1 to 9 do
        if (not(h[x][i])) and (not(l[y][i])) and (not(board[change(x,y)][i])) then
          begin
            h[x][i]:=true;
            l[y][i]:=true;
            board[change(x,y)][i]:=true;
            a[x][y]:=i;
            if y<9 then dfs(x,y+1)
                   else dfs(x+1,1);
            h[x][i]:=false;
            l[y][i]:=false;
            board[change(x,y)][i]:=false;
            a[x][y]:=0;
          end;
    end;
end;
begin
  assign(input,'puzzle.in');
  reset(input);
  assign(output,'puzzle.out');
  rewrite(output);
  for i:=1 to 9 do
    for j:=1 to 9 do
      begin
        read(a[i][j]);
        if a[i][j]<>0 then
          begin
            h[i][a[i][j]]:=true;
            l[j][a[i][j]]:=true;
            board[change(i,j)][a[i][j]]:=true;
          end;
      end;
  dfs(1,1);
  close(input);
  close(output);
end.
