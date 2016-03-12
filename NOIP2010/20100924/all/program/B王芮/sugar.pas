var n,a,c,i:int64;
begin
  assign(input,'sugar.in');
  reset(input);
  assign(output,'sugar.out');
  rewrite(output);
  readln(n);
  a:=3;c:=3;
  i:=2;
  while i<=n do
  begin
  a:=a+c;
  inc(c);
  inc(i);
  end;
 writeln(a);
 close(input);
 close(output);
end.
