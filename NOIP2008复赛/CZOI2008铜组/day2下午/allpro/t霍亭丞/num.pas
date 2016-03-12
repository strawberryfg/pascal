type arr=array[1..1009]of longint;
var a:arr;n,i,total:longint;
procedure try(h:arr;w:longint);
var i,qi,pi:longint;
begin
pi:=0;qi:=0;
for i:=1 to w-1 do
    if a[i]>a[w] then inc(pi);
for i:=w+1 to n do
    if a[i]>a[w] then inc(qi);
if pi=qi then total:=total+1;
end;
begin
assign(input,'num.in');
assign(output,'num.out');
reset(input);rewrite(output);
readln(n);
for i:=1 to n do
    readln(a[i]);
for i:=1 to n do
    try(a,i);
writeln(total);
close(input);close(output);
end.