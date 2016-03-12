const maxn=1000;
type arr=array[1..maxn]of longint;
var s,max,i,j:longint;
    a,b,now:arr;
procedure print;
var i,sum,tot:longint;
begin
sum:=0;
tot:=0;
for i:=2 to s do
    if now[i]=1 then
                     if sum+b[i]<=s then begin sum:=sum+b[i];tot:=tot+a[i];end;
if tot>max then max:=tot;
end;
procedure search(dep:longint);
var i,sum,tot,old,new:longint;
begin
sum:=0;
tot:=0;
old:=2;
new:=2;
while (old<=new)and(old<=s) do
      begin
      if sum+b[new]<=s then begin sum:=sum+b[new];tot:=tot+a[new];end;
      if new=s then begin if tot>max then max:=tot;
                          sum:=0;
                          tot:=0;
                          inc(old);
                          new:=old-1;
                    end;
      inc(new);
      end;
end;
procedure try;
var i,j,t:longint;
begin
for i:=2 to s-1 do
    for j:=i+1 to s do
        if a[i]<a[j] then begin t:=b[i];b[i]:=b[j];b[j]:=t;t:=a[i];a[i]:=a[j];a[j]:=t; end;
end;
procedure start;
var i,sum:longint;
begin
for i:=2 to s do
    begin
    b[i]:=i;
    sum:=1;
    for j:=2 to trunc(sqrt(i)) do
        if i mod j=0 then sum:=sum+j+i div j;
    if j*j=i then sum:=sum-j;
    a[i]:=sum;
    end;
end;
begin
readln(s);
start;
try;
search(2);
writeln(max);
end.