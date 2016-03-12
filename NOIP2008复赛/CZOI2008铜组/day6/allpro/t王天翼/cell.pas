var i,j,m,n,k,t:longint;
    a:array[0..100] of string;
    c:array[1..10000] of integer;
begin
  assign(input,'cell.in');
  reset(input);
  assign(output,'cell.out');
  rewrite(output);
  for i:=0 to m do
    for j:=0 to n do
      a[i,j]:='1';
  readln(m,n);
  for i:=1 to m do
    readln(a[i]);
  k:=0;
  t:=0;
  for i:=1 to m do
    for j:=1 to n do
      if a[i,j]<>'0' then if ((a[i+1,j]<>'0') and (a[i-1,j]<>'0') and (a[i,j-1]<>'0') and (a[i,j+1]<>'0')) then begin inc(k); val(a[i,j],c[k]); end;
  for i:=1 to k do
   for j:=i+1 to k do
     if c[i]=c[j] then c[j]:=0;
  for i:=1 to k do
    if c[i]<>0 then inc(t);
  writeln(t);
  close(input);
  close(output);
end.