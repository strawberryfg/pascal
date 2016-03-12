var n,i,j,max:longint;
    a,b,c:array[1..100] of longint;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
read(n);
for i:=1 to n do
    read(a[i]);
for i:=1 to n do
    for j:=i-1 downto 1 do
        if a[i]>a[j] then
                     if b[j]+1>b[i] then b[i]:=b[j]+1;
for i:=n downto 1 do
    for j:=i+1 to n do
        if a[i]>a[j] then
                     if c[j]+1>c[i] then c[i]:=c[j]+1;
for i:=1 to n do
    if b[i]+c[i]+1>max then max:=b[i]+c[i]+1;
writeln(n-max);
close(input);
close(output);
end.
