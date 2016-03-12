const maxdepth=1020;
var a,b,fmin,i,depth:longint;
    ans,sol:array[0..maxdepth]of longint;
procedure print;
var i:longint;
begin
for i:=1 to depth-1 do write(sol[i],' ');
write(sol[depth]);
writeln;
end;
function gcd(ty,tx:longint):longint;
var x,y,r:longint;
begin
y:=ty; x:=tx;
r:=x mod y;
while r<>0 do
  begin
  x:=y;
  y:=r;
  r:=x mod y;
  end;
exit(y);
end;
procedure dfs(step,ta,tb,tnow:longint);
var t1,t2,t,now:longint;
begin
now:=tnow;
if step>=depth then exit;
if tb mod ta=0 then
   begin
   tb:=tb div ta;
   if tb>fmin then exit;
   if tb<now then exit;
   fmin:=tb;
   ans[step+1]:=tb;
   sol:=ans;
   ans[step+1]:=0;
   exit;
   end;
if step=depth-1 then exit;
while (now<fmin)and(ta*now<tb)do inc(now);
while now<fmin do
  begin
  if tb*(depth-step)<=ta*now then exit;
  ans[step+1]:=now;
  t1:=ta*now-tb; t2:=tb*now;
  t:=gcd(t1,t2);
  t1:=t1 div t; t2:=t2 div t;
  dfs(step+1,t1,t2,now+1);
  inc(now);
  end;
end;
begin
assign(input,'egypt.in');
reset(input);
assign(output,'egypt.out');
rewrite(output);
readln(a,b);
fmin:=maxlongint;
for i:=1 to 1000 do
    begin
    depth:=i;
    dfs(0,a,b,b div a+1);
    if fmin<>maxlongint then
       begin
       print;
       break;
       end;
    end;
close(input);
close(output);
end.
