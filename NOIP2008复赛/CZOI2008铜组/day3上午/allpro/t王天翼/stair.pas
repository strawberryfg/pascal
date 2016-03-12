var n,m,i,j,k,t:longint;
    a,b:array[1..10000] of longint;
begin
  assign(input,'stair.in');
  reset(input);
  assign(output,'stair.out');
  rewrite(output);
  k:=0;
  readln(n,m);
  for i:=1 to m do
    readln(b[i]);
  for i:=1 to n do
    a[i]:=i;
  for i:=1 to n do
    for j:=1 to m do
      if b[j]=a[i] then a[i]:=0;
  for i:=1 to n do
    for j:=1 to n do
      if a[i]=j then inc(k);
  writeln(k);
  close(input);
  close(output);
end.
