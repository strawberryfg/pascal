const maxn=10;
      dx:array[1..2]of longint=(0,1);
      dy:array[1..2]of longint=(1,0);
      bx:array[1..8]of longint=(1,1,2,2,-1,-1,-2,-2);
      by:array[1..8]of longint=(2,-2,1,-1,-2,2,1,-1);
type arr=array[0..maxn,0..maxn]of longint;
var a:arr;
    total,n,m,x,y:longint;
procedure start(x,y:longint);
var i,tx,ty:longint;
begin
a[x,y]:=-10;
for i:=1 to 8 do
    begin
    tx:=x+bx[i];
    ty:=y+by[i];
    if (tx>=0)and(tx<=n)and(ty>=0)and(ty<=m) then a[tx,ty]:=-10;
    end;
end;
procedure try(x,y:longint);
var tx,ty,i:longint;
begin
if (x=n)and(y=m) then inc(total)
                 else
                      for i:=1 to 2 do
                          begin
                          tx:=x+dx[i];
                          ty:=y+dy[i];
                          if (tx<=n)and(ty<=m)and(a[tx,ty]<>-10)then try(tx,ty);
                          end;
end;
begin
read(n,m,x,y);
start(x,y);
try(0,0);
writeln(total);
end.