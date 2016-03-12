var as:longint;
function asd(i,j:longint):longint;
var n,k,a,x:longint;
begin
n:=i;
a:=0;
x:=0;
  while n>j do
  begin
  k:=n mod j;
  a:=a*10+k;
  n:=n div j;
  inc(x);
  end;
for i:=1 to x do
    n:=n*10;
a:=a+n;
as:=a;
end;
function aaa(n:longint):longint;
var x,y,i,j,t:longint;
begin
aaa:=0;
j:=n;
i:=0;
  while j<>0 do
  begin
  j:=j div 10;
  inc(i);
  end;
for j:=1 to i div 2 do
    begin
    x:=n div 10;
    y:=n mod 10;
    if x=y then inc(t);
    n:=n div 10;
    n:=n mod 10;
    end;
if t=i div 2 then aaa:=1;
end;
var t1,t2,t3,i,j,x,y,total:longint;
    n:array[1..36]of longint;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
readln(i,j,x,y);
for i:=i to j do
    begin
    for t1:=0 to y-x do
        begin
        asd(i,x);
        n[t1]:=as;
        end;
    t1:=1;
    t3:=0;
    if aaa(n[t1])=1 then begin t2:=n[t1];t3:=1; end;
    for t1:=2 to y-x do
        if (aaa(n[t1])=1)and(n[t1]<>t2) then begin t2:=n[t1];t3:=t3+1;end;
    if t3=1 then inc(total);
    end;
writeln(total);
close(input);
close(output);
end.