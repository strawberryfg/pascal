var a:array[1..20,1..20]of longint;
    i,j,k,n:longint;
begin
read(n);
for i:=1 to n do
    for j:=i to 2*n-i do
        for k:=i to 2*n-i do
            a[j,k]:=i;
for i:=1 to 2*n-1 do
    begin
    for j:=1 to 2*n-1 do
        write(a[i,j]:4);
    writeln;
    end;
end.