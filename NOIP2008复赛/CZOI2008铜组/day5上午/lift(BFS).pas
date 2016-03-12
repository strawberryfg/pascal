var n,a,b,i,old,new,tx:longint;
    f,x,from,go:array[1..200]of longint;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
readln(n,a,b);
if a=b then begin writeln(0);close(input);close(output);halt; end;
for i:=1 to n do
    read(f[i]);
old:=1;
new:=1;
x[1]:=a;
from[1]:=0;
while old<=new do
     begin
     for i:=1 to 2 do
         begin
         if i=1 then tx:=x[old]+f[x[old]] else tx:=x[old]-f[x[old]];
         if tx=b then
         begin
         writeln(from[old]+1);
         close(input);
         close(output);
         halt;
         end;
         if (tx<=n)and(tx>0)and(go[tx]=0) then
            begin
            inc(new);
            x[new]:=tx;
            go[tx]:=1;
            from[new]:=from[old]+1;
            end;
         end;
     inc(old);
     end;
writeln(-1);
close(input);
close(output);
end.
