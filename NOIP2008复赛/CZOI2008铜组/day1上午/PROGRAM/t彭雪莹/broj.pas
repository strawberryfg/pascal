var n,t:longint;
    s:int64;
begin
  assign(input,'broj.in');
  reset(input);
  assign(output,'broj.out');
  rewrite(output);
  read(n);
  t:=1;
  s:=0;
  while t<=n do
   begin
    s:=n-t+1+s;
    t:=t*10;
    end;
   writeln(s);
   close(input);
   close(output);
end.