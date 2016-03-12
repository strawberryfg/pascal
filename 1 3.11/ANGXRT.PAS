var i,j,n:longint;
begin
read(n);
for i:=n downto 1 do
begin
 for j:=1 to n do
  begin
  if j<=n-i then write(' ') else write('*');
  end;
writeln;
end;
end.