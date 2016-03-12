const maxn=10;
      dx:array[1..8]of longint=(1,1,2,2,-1,-1,-2,-2);
      dy:array[1..8]of longint=(2,-2,1,-1,-2,2,1,-1);
type arr=array[1..maxn,1..maxn] of longint;
var m,n,x,y:longint;
    a:arr;
procedure print;
var i,j:longint;
begin
for i:=1 to m do
    begin
    for j:=1 to n do
        write(a[i,j]:3);
    writeln;
    end;
halt;
end;
procedure jump(dep,x,y:longint);
var tx,ty,i:longint;
 begin
 a[x,y]:=dep;
 if dep=m*n then print
            else for i:=1 to 8 do
                 begin
                     tx:=x+dx[i];
                     ty:=y+dy[i];
                     if (tx>0)and(tx<=m)and(ty>0)and(ty<=n)and(a[tx,ty]=0) then
                        jump(dep+1,tx,ty);
                 end;
 a[x,y]:=0;
 end;
begin
read(m,n,x,y);
jump(1,x,y);
end.
