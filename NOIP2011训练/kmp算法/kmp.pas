const maxn=100;
var t,p:string;
    next:array[1..maxn]of longint;
    n,m,i,j:longint;
procedure compute(p:string);
var m,i,j:longint;
begin
m:=length(p);
next[1]:=0; j:=0;
for i:=2 to m do
    begin
    while (j>0)and(p[j+1]<>p[i]) do j:=next[j];
    if p[j+1]=p[i] then inc(j);
    next[i]:=j;
    end;
end;
begin
readln(t);
readln(p);
compute(p);
j:=0;
n:=length(t);
m:=length(p);
for i:=1 to n do
    begin
    while (j>0)and(p[j+1]<>t[i]) do j:=next[j];
    if p[j+1]=t[i] then inc(j);
    if j=m then
       begin
       writeln(i-m+1,'    ',i);
       j:=next[j];
       end;
    end;
end.