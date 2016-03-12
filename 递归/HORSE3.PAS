const maxn=10;
      bx:array[1..4]of longint=(-1,1,-2,2);
      by:array[1..4]of longint=(2,2,1,1);
type arr=array[0..maxn,0..maxn]of longint;
     xy=array[1..maxn] of longint;
var a:arr;
    rx,ry:xy;
    n,m:longint;
procedure print(n:longint);
var i:longint;
begin
for i:=1 to n do
    if i<n then write('(',rx[i],',',ry[i],')-->')
           else write('(',rx[i],',',ry[i],')');
writeln;
halt;
end;
procedure try(dep,x,y:longint);
var tx,ty,i:longint;
begin
rx[dep]:=x;
ry[dep]:=y;
if (x=n)and(y=m) then print(dep)
                 else
                 for i:=1 to 4 do
                 begin
                      tx:=x+bx[i];
                      ty:=y+by[i];
                      if (tx>=0)and(tx<=n)and(ty>=0)and(ty<=m) then  try(dep+1,tx,ty);
                 end;
rx[dep]:=0;
ry[dep]:=0;
end;
begin
readln(n,m);
try(1,0,0);
end.