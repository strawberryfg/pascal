program j402;
type arr1=array[1..65] of integer;
     arr2=array[1..65] of arr1;
var  board:arr2;
     tile:integer;
     size,dr,dc:integer;

procedure chessboard(tr,tc:integer;dr,dc:integer;var size:integer);
var t,s:integer;
begin
 if (size=1) then  exit;
 t:=tile; inc(tile);
 s:=size div 2;
 if (dr<tr+s) and (dc<tc+s) then
   chessboard(tr,tc,dr,dc,s)
 else
  begin
   board[tr+s-1][tc+s-1]:=t;
   chessboard(tr,tc,tr+s-1,tc+s-1,s);
  end;
 if(dr<tr+s) and (dc>=tc+s) then
  chessboard(tr,tc+s,dr,dc,s)
 else
  begin
    board[tr+s-1][tc+s]:=t;
    chessboard(tr,tc+s,tr+s-1,tc+s,s);
  end;
 if(dr>=tr+s) and(dc<tc+s) then
  chessboard(tr+s,tc,dr,dc,s)
 else
  begin
   board[tr+s][tc+s-1]:=t;
   chessboard(tr+s,tc,tr+s,tc+s-1,s);
  end;
 if (dr>=tr+s) and (dc>=tc+s) then
  chessboard(tr+s,tc+s,dr,dc,s)
 else
  begin
    board[tr+s][tc+s]:=t;
    chessboard(tr+s,tc+s,tr+s,tc+s,s);
  end;
end;

procedure  prt1(n:integer);
var i,j:integer;
begin
 for i:=1 to n do
  begin
   for j:=1 to n do
    write(board[i][j]:3);
   writeln;
  end;
end;
begin
  writeln('input size(4/8/16/64):');
  readln(size);
  writeln('input the position of special block(x,y):');
  readln(dr,dc);
  board[dr][dc]:=-1;
  tile:=1;
  chessboard(1,1,dr,dc,size);
  prt1(size);
end.
