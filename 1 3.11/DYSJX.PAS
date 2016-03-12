var i,j,n,k:longint;
begin
read(n);
for i:=1 to n do
begin
write(' ':30-i);
 for j:=1 to 2*i-1 do write('*');
 writeln;
end;
end.