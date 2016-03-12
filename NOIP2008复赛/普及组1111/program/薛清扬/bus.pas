var n,d,i,j,min1,s,t,e,f:longint;
b:char;
a:array[1..10000]of char;
pd:boolean;
procedure try(x:longint);
var i:longint;
begin
e:=0;
f:=0;
if s>0 then e:=s;
if s<0 then f:=0-s;
for i:=x to n do
begin
if a[i]=b then begin inc(s);inc(e);if (abs(s)>d) and(f>=5) then begin if min1>0 then min1:=min1+2 else inc(min1); t:=1;s:=0;f:=0;end else f:=0; end
else begin dec(s);inc(f);if (abs(s)>d) and(e>=5) then begin if min1>0 then min1:=min1+2 else inc(min1);t:=1;s:=0;e:=0; end else e:=0; end;
if abs(s)<=d then t:=i;
end;
if t<>0 then begin j:=t;pd:=true;end;
end;
procedure my(x:longint);
begin
if a[x]=b then inc(s)
else dec(s);
if abs(s)>d then begin t:=0; pd:=false;try(x); if pd=false then begin inc(min1);s:=0;end;end;
end;
begin
assign(input,'bus.in');
assign(output,'bus.out');
reset(input);
rewrite(output);
readln(n,d);
read(a[1]);
b:=a[1];
for i:=2 to n do
begin
read(a[i]);
end;
for i:=1 to n do
if a[i]=b then inc(s)
else dec(s);
if abs(s)<=d then writeln('1')
else begin
s:=0;
for j:=1 to n do
my(j);
writeln(min1);
end;
close(input);
close(output);
end.