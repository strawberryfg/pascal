var n,k:longint;
    sum:real;
begin
read(k);
sum:=0;
n:=1;
while sum<=k do
      begin
      sum:=sum+1 / n;
      inc(n);
      end;
writeln(n-1);
end.