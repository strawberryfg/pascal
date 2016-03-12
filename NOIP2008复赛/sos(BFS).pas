const dx:array[1..4]of integer=(0,1,-1,0);
      dy:array[1..4]of integer=(-1,0,0,1);
var i,j,n,old,new,tx,ty:longint;
    x,y,from:array[0..1001]of longint;
    map,a:array[1..30,1..30]of longint;
begin
assign(input,'sos.in');
reset(input);
assign(output,'sos.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do read(map[i,j]);
    readln;
    end;
old:=1;
new:=1;
from[1]:=1;
x[1]:=n;
y[1]:=n;
while old<=new do
     begin
     for i:=1 to 4 do
         begin
         tx:=x[old]+dx[i];
         ty:=y[old]+dy[i];
         if (tx<=n)and(tx>0)and(ty<=n)and(ty>0)and(a[tx,ty]=0)and(map[tx,ty]=0) then
            begin
            inc(new);
            x[new]:=tx;
            y[new]:=ty;
            a[tx,ty]:=1;
            from[new]:=from[old]+1;
            if (tx=1)and(ty=1) then begin writeln(from[new]);break; end;
            end;
         end;
     inc(old);
     end;
close(input);
close(output);
end.