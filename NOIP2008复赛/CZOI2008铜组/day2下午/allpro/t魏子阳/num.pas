var n,s,i,s1,s2,j:longint;
    a:array[1..10000]of longint;
begin
assign(input,'num.in');assign(output,'num.out');
reset(input);rewrite(output);
readln(n);
for i:=1 to n do readln(a[i]);
s:=0;
for i:=1 to n do
    begin
    s1:=0;s2:=0;
    for j:=1 to i-1 do
        if a[j]>a[i] then inc(s1);
    for j:=i+1 to n do
        if a[j]>a[i] then inc(s2);
    if s1=s2 then inc(s);
    end;
write(s);
close(input);close(output);
end.
