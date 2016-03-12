var a:array[1..1001,1..2] of longint;
    n,i,j,sum:longint;
function f(n:longint):longint;
var t:longint;
begin
t:=a[n,2]-a[n,1]+1;
if t<a[n+1,2]-a[n+1,1]+1 then f:=n else f:=n+1;
end;
procedure del(start:longint);
var i:longint;
begin
for i:=start+1 to n+1 do
    begin
    a[i-1,1]:=a[i,1];
    a[i-1,2]:=a[i,2]
    end;
dec(n);
end;
procedure swap(var a,b:longint);
var t:longint;
begin
t:=a;
a:=b;
b:=t;
end;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
readln(n);
for i:=1 to n do
    readln(a[i,1],a[i,2]);
for i:=1 to n-1 do
    for j:=i+1 to n do
    if a[i,1]>a[j,1]
       then begin swap(a[i,1],a[j,1]);swap(a[i,2],a[j,2])end;
for i:=1 to n-1 do
    if a[i,2]<=a[i+1,1]
       then del(f(i));
for i:=1 to n do
    inc(sum,a[i,2]-a[i,1]+1);
writeln(sum);
close(input);
close(output);
end.
