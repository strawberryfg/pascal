var m,n,a,b,c,d,i,j:longint;
v:array[1..17]of integer;
function oo(a,b:longint):boolean;
var c,d,i,j:longint;
begin
c:=a+b;
for i:=2 to trunc(sqrt(c)) do
if c mod i=0 then d:=d+1;
if d=0 then oo:=true
else oo:=false;
end;
begin
assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output);
readln(n);
v[i]:=1;
for i:=2 to n do
if (oo(1,i)=true) then v[2]:=i;
for i:=1 to n-1 do
write(v[i],' ');
writeln(v[n]);
close(input);
close(output);
end.

