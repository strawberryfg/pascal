var a:array[1..20,1..20] of longint;
    i,j,k,n:longint;
begin
read(n);
for i:=1 to n do
    begin
    a[i,1]:=1;
    for j:=2 to i-1 do
        a[i,j]:=a[i-1,j-1]+a[i-1,j];
    a[i,i]:=1;
    end;
for i:=1 to n do
    begin
    for k:=1 to n-i do
        write(' ':3);
    for j:=1 to i do write(a[i,j]:6);
    writeln;
    end;
end.