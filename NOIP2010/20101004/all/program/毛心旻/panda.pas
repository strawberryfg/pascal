var n,k,t,i,j:longint;
    min:int64;
    a,h:array[0..1000]of longint;
    f:array[0..100000]of longint;
begin
assign(input,'panda.in');
reset(input);
assign(output,'panda.out');
rewrite(output);
read(n,k);
for i:=1 to n do
    read(a[i]);
f[0]:=1;
for i:=1 to k do
    begin
    min:=maxlongint;
    for j:=1 to n do
        begin
        if a[j]*f[h[a[j]]]=f[t] then inc(h[a[j]]);
        if min>a[j]*f[h[a[j]]] then min:=a[j]*f[h[a[j]]];
        end;
    inc(t);
    f[t]:=min;
    end;
writeln(f[k]);
close(input);
close(output);
end.
