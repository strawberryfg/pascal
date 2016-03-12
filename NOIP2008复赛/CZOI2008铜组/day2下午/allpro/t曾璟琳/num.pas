var n,i,s:longint;
    a:array[1..10000]of longint;
function num(i:integer):boolean;
var m,k,l,x,y:integer;
begin
m:=1;
k:=i-1;
x:=0;
for l:=m to k do
  if a[l]>a[i] then inc(x);
m:=i+1;
k:=n;
y:=0;
for l:=m to k do
   if a[l]>a[i] then inc(y);
if x=y then num:=true
       else num:=false;
end;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(n);
s:=0;
for i:=1 to n do
  readln(a[i]);
for i:=1 to n do
  if num(i) then inc(s);
writeln(s);
close(input);
close(output);
end.