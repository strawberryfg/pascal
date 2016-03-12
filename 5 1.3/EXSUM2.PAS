var n,i:longint;
    sum:real;
begin
read(n);
i:=1;
while i<=n do
      begin
      if i mod 2=1 then sum:=sum+1/i
                   else sum:=sum-1/i;
      i:=i+1;
      end;
writeln(sum:0:4);
end.