var i,n,s:longint;
    a:array[1..1000] of longint;
function jh(x,y:longint):longint;
var r:longint;
begin
r:=0;
while y<>0 do
begin
      r:=x mod y;
      x:=y;
      y:=r;
    end;
jh:=x;
end;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
n:=0;
while not eof do
              begin
              inc(n);
              readln(a[n]);
              end;
i:=2;s:=a[1];
while (i<=n)and(s<>1) do
      begin
      s:=jh(s,a[i]);
      inc(i);
      end;
writeln(s);
close(input);
close(output);
end.
