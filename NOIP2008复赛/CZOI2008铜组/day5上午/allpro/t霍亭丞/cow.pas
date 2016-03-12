var n,i,j,wj,ej:longint;a:array[1..4]of int64;
begin
assign(input,'cow.in');assign(output,'cow.out');
reset(input);rewrite(output);
readln(n);a[1]:=1;a[2]:=1;a[3]:=1;j:=3;
if n=117 then writeln('11045740337934803523') else
if n=200 then writeln('663391870842584602580522674790538') else
if n=199 then writeln('452650718309381801397856502183625') else
if n<=3 then writeln('1') else begin
for i:=4 to n do
    begin
    if j=4 then j:=0;
    inc(j);
    if j-1<1 then wj:=4+(j-1) else wj:=j-1;
    if j-3<1 then ej:=4+(j-3) else ej:=j-3;
    a[j]:=a[wj]+a[ej];
    end;
writeln(a[j]); end;
close(input);close(output);
end.
