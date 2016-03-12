VAR  a:array[1..1000] of longint;
     i,n,total:longint;
procedure try(dep:longint);
var i,j,t,t1:longint;
begin
t:=0;
t1:=0;
for j:=1 to dep-1 do
    if a[j]>a[dep] then inc(t);
for j:=dep+1 to n do
   if a[j]>a[dep] then inc(t1);
   if t=t1 then inc(total);
end;
BEGIN
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
total:=0;
read(n);
for i:=1 to n do
begin
read(a[i]);
end;
for i:=1 to n do
try(i);
writeln(total);
close(input);
close(output);
END.