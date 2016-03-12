var i,j,n,len,max:longint;
    a,f:array[1..100]of longint;
begin
readln(n);
for i:=1 to n do
    read(a[i]);
for i:=1 to n do f[i]:=1;
for i:=2 to n do
    begin
    len:=0;
    for j:=1 to i-1 do
        if (a[j]<=a[i])and(f[j]+1>len) then len:=f[j];
    if len>0 then f[i]:=len+1;
    end;
for i:=1 to n do
    if f[i]>max then max:=f[i];
writeln(max);
end.