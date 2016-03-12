var a:array[1..20] of longint;
    b:array[2..19] of longint;
    i,j,n:longint;
begin
read(n);
for i:=1 to n do
    begin
    for j:=1 to n-i do
        write(' ':3);
    for j:=2 to i-1 do
        b[j]:=a[j-1]+a[j];
    a[1]:=1;
    write(1:6);
    for j:=2 to i-1 do write(b[j]:6);
    a[i]:=1;
    if i>1 then write(1:6);
    for j:=2 to i-1 do
        a[j]:=b[j];
    writeln;
    end;
end.