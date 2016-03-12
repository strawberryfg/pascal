var i,j,n:longint;
begin
read(n);
for i:=1 to n do
begin
 for j:=1 to i do
  begin
  if j=1 then write('*':n-i+1) else write('*');
  end;
writeln;
end;
end.