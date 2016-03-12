var n,i,j,p,q,sum:longint;
    a:array[1..1001] of longint;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(n);
for i:=1 to n do
readln(a[i]);
for i:=1 to n do
    begin
    p:=0;
    q:=0;
    for j:=1 to i-1 do
        if a[j]>a[i] then inc(p);
    for j:=i+1 to n do
        if a[i]<a[j] then inc(q);
    if p=q then inc(sum);
    end;
writeln(sum);
close(input);
close(output);
end.