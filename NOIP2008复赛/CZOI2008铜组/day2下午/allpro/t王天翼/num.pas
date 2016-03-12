var n,i,j,t,t1,k,c:longint;
    a:array[1..1000] of longint;
begin
  assign(input,'num.in');
  reset(input);
  assign(output,'num.out');
  rewrite(output);
  readln(n);
  t:=0;t1:=0;k:=0;
  for i:=1 to n do
    readln(a[i]);
  for i:=1 to n do
    begin
      for j:=1 to i do
        if a[j]>a[i] then inc(t);
      for c:=i to n do
        if a[c]>a[i] then inc(t1);
      if t=t1 then inc(k);
      t:=0;
      t1:=0;
    end;
  writeln(k);
  close(input);
  close(output);
end.
