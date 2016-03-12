var i,j,n:longint;
    a,t:array[0..100]of longint;
    s:array[0..100,0..100]of longint;
begin
readln(n);
for i:=1 to n do begin read(a[i]);t[i]:=t[i-1]+a[i]; end;
for i:=1 to n do
    for j:=1 to n+1-i do
        s[j,j+i]:=t[j+i]-t[j-1];
for i:=1 to n do
    begin
    for j:=i+1 to n do
        if i<>j then write(' ',i,',',j,':',s[i,j]:4,'      ');
    writeln;
    end;
end.