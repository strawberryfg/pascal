var i,j,n,t1,max,mf,mon,t,k:longint;
    w:array[1..50]of longint;
    f,m,s:array[1..51,0..200]of longint;
    hash:array[1..1000]of shortint;
function calc(main,monitor:longint):longint;
begin
if (main=0)or(monitor=0) then exit(0);
if monitor/main>2 then exit(main)
   else exit(monitor div 2);
end;
procedure try(dep,a,b:longint);
var t,i:longint;
begin
if dep>n then
   begin
   t:=calc(a,b);
   if t>max then
      max:=t;
   end
else
   for i:=0 to w[dep]div 7 do
       try(dep+1,a+f[dep,i],b+m[dep,i]);
end;
begin
assign(input,'config.in');
reset(input);
assign(output,'config.out');
rewrite(output);
readln(n);
max:=0;
for i:=1 to n do readln(w[i]);
for i:=1 to n do
    begin
    t1:=w[i]div 7;
    for j:=0 to t1 do
        begin
        mf:=j;
        mon:=(w[i]-7*j)div 10;
        f[i,j]:=mf; m[i,j]:=mon;
        end;
    end;
try(1,0,0);
writeln(max);
close(input);
close(output);
end.
