var a:array[1..2000,1..2]of longint;
    b:array[1..1000]of longint;
    max,n:longint;

procedure startt;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
end;

procedure endit;
begin
close(input);
close(output);
end;

procedure intt;
var i:longint;
begin
readln(n);
for i:=1 to n do
  readln(a[i,1],a[i,2]);
end;

procedure outt;
begin
writeln(max);
end;

procedure try(d,e,f,g:longint);
var mi,mx,i,tmax:longint;
begin
tmax:=0;
if d>f then mi:=f
       else mi:=d;
if e>g then mx:=e
       else mx:=g;
for i:=d to e do
  b[i]:=1;
for i:=f to g do
  b[i]:=1;
for i:=mi to mx do
  if b[i]=1 then inc(tmax);
if tmax>max then max:=tmax;
end;

procedure runit;
var t,k,p:longint;
begin
if n=1 then begin
              writeln(a[1,2]-a[1,1]+1);
              endit;
              halt;
            end;
t:=(n+1)*n div 2;
for k:=1 to k do
  for p:=k+1 to n do
    try(a[k,1],a[k,2],a[p,1],a[p,2]);
end;

begin
startt;
intt;
runit;
outt;
endit;
end.