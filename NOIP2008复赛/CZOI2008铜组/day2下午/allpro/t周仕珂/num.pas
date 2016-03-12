var total,i,n:longint;
        a:array[0..10000] of longint;
function pd(m:longint):boolean;
var i,s1,s2:longint;
begin
s1:=0;
s2:=0;
for i:=1 to m do
        if a[i]>a[m] then inc(s1);
for i:=m+1 to n do
        if a[i]>a[m] then inc(s2);
if s1=s2 then pd:=true
        else pd:=false;
end;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
total:=0;
readln(n);
for i:=1 to n do
        read(a[i]);
for i:=1 to n do
        if pd(i) then inc(total);
writeln(total);
close(input);
close(output);
end.
