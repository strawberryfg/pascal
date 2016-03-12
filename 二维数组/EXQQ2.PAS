var  a:array[1..20,1..20]of longint;
     i,n,j,t:longint;
begin
read(n);
for i:=1 to n do
begin
t:=i;
if i>(n+1)div 2 then t:=n+1-i;
       for j:=1 to t-1 do
           a[i,j]:=j;
       for j:=t to n+1-t do
           a[i,j]:=t;
       for j:=t-1 downto 1 do
           a[i,n-j+1]:=j;
end;
for i:=1 to n do
    begin
    for j:=1 to n do
        write(a[i,j]:4);
    writeln;
    end;
end.