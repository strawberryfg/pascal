var i,a,j:longint;
begin
read(a);
for i:=a downto 1 do
begin
 for j:=i downto 1 do
  write('*');
writeln;
end;
end.