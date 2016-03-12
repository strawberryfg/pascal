program cell;
const
  fx:array[1..4,1..2] of integer=((-1,0),(0,1),(1,0),(0,-1));
var
  map:array[1..100] of string;
  a:array[1..10000,1..2] of integer;
  m,n,i,j,k,sum,x,y,front,rear:integer;

begin
  assign(input,'cell.in');
  reset(input);
  assign(output,'cell.out');
  rewrite(output);

  readln(m,n);
  for i:=1 to m do
    readln(map[i]);
  sum:=0;
  for i:=1 to m do
    for j:=1 to n do
      if map[i,j]<>'0'
      then begin
             inc(sum);
             a[1,1]:=i;
             a[1,2]:=j;
             map[i,j]:='0';
             front:=1;
             rear:=1;
             while front<=rear do
             begin
               for k:=1 to 4 do
               begin
                 x:=a[front,1]+fx[k,1];
                 y:=a[front,2]+fx[k,2];
                 if (x>0) and (x<=m) and (y>0) and (y<=n) and (map[x,y]<>'0')
                 then begin
                        inc(rear);
                        a[rear,1]:=x;
                        a[rear,2]:=y;
                        map[x,y]:='0';
                      end;
               end;
               inc(front);
             end;
           end;
  writeln(sum);

  close(input);
  close(output);
end.
