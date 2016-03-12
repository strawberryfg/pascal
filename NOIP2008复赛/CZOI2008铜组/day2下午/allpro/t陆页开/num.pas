var i,n,j,k,t,tt,ttt:longint;
    a:array[1.. 1000] of longint;
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
    for j:=1 to i do
        if a[j]>a[i] then inc(t);
    for k:=i to n do
        if a[k]>a[i] then inc(tt);
    if t=tt then ttt:=ttt+1;;
    t:=0;
    tt:=0;
    end;
writeln(ttt);
close(input);
close(output);
end.