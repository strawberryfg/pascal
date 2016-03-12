var l1,l2,e1,e2,s,i,j,t:longint;
    ok:boolean;
function change(x,y:longint):boolean;
var i,j,k,m,l,tt,h,t:longint;
    a:array[1..100]of longint;
begin
for i:=1 to 100 do a[i]:=0;
change:=true;
tt:=1;
l:=1;
while x>=(l*y) do
      begin
      inc(tt);
      l:=l*y;
      end;
m:=x;
for i:=1 to tt do
    begin
    a[i]:=m div l;
    m:=m-(m div l)*l;
    l:=l div y;
    end;
h:=1;t:=tt;
if h=t then change:=false;
while h<t do
      begin
      if a[h]<>a[t] then change:=false;
      if change=false then break;
      inc(h);dec(t);
      end;
end;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
read(l1,e1,l2,e2);
s:=0;
for i:=round(sqrt(l1)) to trunc(sqrt(e1)) do
    begin
    ok:=false;
    t:=sqr(i);
    for j:=l2 to e2 do
        begin
        if (ok=false) then begin if change(t,j)=true then ok:=true;end
                      else begin if change(t,j)=true then ok:=false;end;
        end;
    if ok=true then inc(s);
    end;
write(s);
close(input);
close(output);
end.
