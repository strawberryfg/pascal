var n,i,j,s1,s2,sum:longint;
    a:array[1..1000]of longint;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
sum:=0;
readln(n);
for i:=1 to n do
    readln(a[i]);
for i:=1 to n do
    begin
    s1:=0;
    s2:=0;
    for j:=1 to i-1 do
        if a[j]>a[i] then inc(s1);
    for j:=i+1 to n do
        if a[j]>a[i] then inc(s2);
    if s1=s2 then inc(sum);
    end;
writeln(sum);
close(input);
close(output);
end.