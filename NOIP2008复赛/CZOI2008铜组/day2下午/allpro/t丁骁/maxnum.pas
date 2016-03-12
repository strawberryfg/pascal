var n,i,ne:longint;
    a:array[1..1000] of longint;
function ws(p,q:longint):longint;
var r:longint;
begin
r:=0;
while q<>0 do
      begin
      r:=p mod q;
      p:=q;
      q:=r;
      end;
ws:=p;
end;
begin
assign(input,'maxnum.in');
assign(output,'maxnum.out');
reset(input);
rewrite(output);
n:=0;
while n<3 do
      begin
      inc(n);
      readln(a[n]);
      end;
ne:=a[1]; i:=2;
while (i<=n)and(ne<>1) do
      begin
      ne:=ws(ne,a[i]);
      inc(i);
      end;
writeln(ne);
close(input);
close(output);
end.
