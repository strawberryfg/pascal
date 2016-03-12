var a:array[1..4]of longint;
    n,i,j,t:longint;
begin
read(n);
repeat
begin
for i:=4 downto 1 do
    begin
    a[i]:=n mod 10;n:=n div 10;
    end;
for i:=1 to 3 do
    begin
    for j:=i+1 to 4 do
        if a[i]<a[j] then begin t:=a[i];a[i]:=a[j];a[j]:=t; end;
    end;
for i:=1 to 4 do
    n:=n*10+a[i];
t:=0;
for i:=4 downto 1 do
    t:=t*10+a[i];
writeln(n,'-',t,'=',n-t);
n:=n-t;
end;
until n=6174;
end.