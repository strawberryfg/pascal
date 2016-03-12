var i,num,n:longint;
    a:array[1..1001] of longint;
function pd(p:longint):boolean;
var j,r:longint;
begin
r:=0; pd:=false;
for j:=1 to i-1 do
    if a[j]>p then inc(r);
for j:=i+1 to n do
    if a[j]>p then dec(r);
if r=0 then pd:=true;
end;
begin
assign(input,'num.in');
assign(output,'num.out');
reset(input);
rewrite(output);
readln(n);
for i:=1 to n do
    readln(a[i]);
num:=0;
for i:=1 to n do
    if pd(a[i]) then inc(num);
writeln(num);
close(input);
close(output);
end.
