var i,j,n,s:longint;
    a:array[1..100,1..100]of longint;
begin
readln(n);
s:=1;
for i:=1 to (n+1)div 2 do
    begin
    for j:=i to n+1-i do
        begin a[i,j]:=s;inc(s); end;
    for j:=i+1 to n+1-i do
        begin a[j,n+1-i]:=s;inc(s);end;
    for j:=n-i downto i do
        begin a[n+1-i,j]:=s;inc(s);end;
    for j:=n-i downto i+1 do
        begin a[j,i]:=s;inc(s);end;
    end;
for i:=1 to n do
    begin
    for j:=1 to n do
        write(a[i,j]:4);
    writeln;
    end;
end.
