var a:array[0..9]of longint;
    n,x,i,t:longint;
begin
  assign(input,'count.in');
  reset(input);
  assign(output,'count.out');
  rewrite(output);
  readln(n);
  for i:=0 to 9 do
  a[i]:=0;
  for i:=1 to n do
  begin
  x:=i;
  while x<>0 do
  begin
  t:=x mod 10;
  x:=x div 10;
  a[t]:=a[t]+1;
  end;
  end;
  for i:=0 to 9 do
  writeln(a[i]);
  close(input);
  close(output);
end.
