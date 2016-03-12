var i,j,c,k,m:longint;
    a,b:array[1..10000] of longint;
function zdg(m,n:longint):longint;
var r:longint;
begin
  repeat
    r:=m mod n;
    m:=n;
    n:=r;
  until r=0;
  zdg:=m;
end;
begin
  assign(input,'maxnum.in');
  reset(input);
  assign(output,'maxnum.out');
  rewrite(output);
  i:=0;k:=0;
  while not eof do
  begin
    inc(i);
    readln(a[i]);
  end;
  for j:=1 to i do
    for c:=j+1 to i do
      begin
        inc(k);
        b[k]:=zdg(a[j],a[c]);
      end;
m:=b[1];
  for j:=1 to k do
    if b[j]<m then m:=b[j];
  writeln(m);
  close(input);
  close(output);
end.
