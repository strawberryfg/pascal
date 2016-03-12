var s:array[1..2500]of char;
    f:array[0..2500]of longint;
    n,d,i,j,min:longint;
function pd(b,e:longint):boolean;
var i,h,j:longint;
begin
j:=0;
h:=0;
for i:=b to e do
    if s[i]='H' then inc(h)
                else inc(j);
pd:=true;
if (h=0)or(j=0) then exit;
if abs(h-j)>d then pd:=false;
end;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n,d);
for i:=1 to n do
read(s[i]);
f[0]:=0;
f[1]:=1;
f[2]:=1;
for i:=3 to n do
    begin
    min:=f[i-1]+1;
    for j:=0 to i-1 do
        if (f[j]+1<min)and(pd(j+1,i)=true) then min:=f[j]+1;
    f[i]:=min;
    end;
writeln(f[n]);
close(input);
close(output);
end.