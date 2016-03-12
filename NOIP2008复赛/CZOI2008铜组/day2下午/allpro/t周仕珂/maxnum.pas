var s,ts,q,t,i:longint;
        a:array[1..10000] of longint;
function zdgys(a,b:longint):longint;
var r:longint;
begin
while b<>0 do
        begin
                r:=a mod b;
                a:=b;
                b:=r;
        end;
zdgys:=a;
end;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
s:=0;
{read(s);
for i:=1 to s do
        read(a[i]); }
while not eof do
        begin
        inc(s);
        readln(a[s]);
        end;
ts:=s;
q:=0;
while ts<>0 do
        begin
              inc(q);
              t:=zdgys(a[q],a[q+1]);
              a[q+1]:=t;
              dec(ts);
        end;
writeln(t);
close(input);
close(output);
end.
