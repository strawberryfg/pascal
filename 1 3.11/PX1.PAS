var i,j,n:longint;
begin
read(n);
for i:=1 to n do
begin
 for j:=1 to 2*n-i do
   if j<=2*n-i-n then write(' ') else write('*');
writeln;
end;
end.