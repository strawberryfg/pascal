var s,i,n,t1,t2:longint;
begin
  assign(input,'sugar.in');
  assign(output,'sugar.out');
  reset(input);
  rewrite(output);
  readln(n);
  t1:=3;
  t2:=3;
  for i:=2 to n do
      begin
        inc(t1,t2);
        inc(t2);
      end;
  writeln(t1);
  close(input);
  close(output);
end.