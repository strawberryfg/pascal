var i,n,j,t:longint;
begin
read(n);
for i:=1 to n do
begin
t:=i;
if i>(n+1)div 2 then t:=n+1-i;
       for j:=1 to t-1 do
           write(j:3);
       for j:=1 to n-2*(t-1) do
           write(t:3);
       for j:=t-1 downto 1 do
           write(j:3);
writeln;
end;
end.