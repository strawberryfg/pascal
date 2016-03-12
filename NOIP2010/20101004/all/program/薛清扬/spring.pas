var a:array[1..100,1..100]of longint;
b:array[1..100,1..100]of boolean;
n,i,j,s,min:longint;
procedure try(x:longint);
var i,j,k:longint;
begin
for i:=1 to n do
for j:=1 to n do
if (b[i,j]=true)and(i<>j)and(b[j,i]=true) then
begin
for k:=1 to n do
begin
b[i,k]:=false;
b[j,k]:=false;
end;
s:=s+a[i,j];
if x<n div 2 then
try(x+1) else if s<min then min:=s;
s:=s-a[i,j];
for k:=1 to n do
begin
b[i,k]:=true;
b[j,k]:=true;
end;
end;
end;
begin
assign(input,'spring.in');
assign(output,'spring.out');
reset(input);
rewrite(output);
readln(n);
min:=maxlongint;
for i:=1 to n do
for j:=1 to n do
b[i,j]:=true;
for i:=1 to n do
for j:=1 to n do
read(a[i,j]);
try(1);
writeln(min);
close(input);
close(output);
end.