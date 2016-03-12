var k,n:longint;
    sum:real;
procedure try(var n:longint);
  begin
  sum:=sum+1 / n;
  if sum>k then exit
           else begin inc(n);try(n);end;
  end;
begin
read(k);
n:=1;
try(n);
writeln(n);
end.