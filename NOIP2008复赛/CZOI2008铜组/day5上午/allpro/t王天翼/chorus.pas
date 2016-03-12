var n,i,t:integer;
    a:array[1..10000] of integer;
begin
  assign(input,'chorus.in');
  reset(input);
  assign(output,'chorus.out');
  rewrite(output);
  readln(n);
  t:=0;
  for i:=1 to n do
    read(a[i]);
  for i:=1 to n div 2 do
    if a[i+1]<a[i] then inc(t);
  for i:=n div 2 to n do
    if a[i+1]>a[i] then inc(t);
  writeln(t);
  close(input);
  close(output);
end.
