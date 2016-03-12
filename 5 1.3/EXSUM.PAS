var a,b,i,n:longint;
begin
read(n);
a:=0;
b:=0;
while i<=n  do
      begin
      a:=a+b;
      b:=b+1;
      inc(i);
      end;
writeln(a);
end.