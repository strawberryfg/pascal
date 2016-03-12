const maxn=5020;
var n,m,i,j,best,ans:longint;
    a,b:array[1..maxn]of longint;
    f,tf:array[0..maxn]of longint;
begin
assign(input,'ornament.in');
reset(input);
assign(output,'ornament.out');
rewrite(output);
readln(n);
for i:=1 to n do read(a[i]);
readln(m);
for i:=1 to m do read(b[i]);
for i:=1 to n do
    begin
    best:=0;
    tf:=f;
    for j:=1 to m do
        begin
        if a[i]=b[j] then tf[j]:=best+1;
        if b[j]<a[i] then
           begin
           if f[j]>best then best:=f[j];
           end;
        end;
    f:=tf;
    end;
ans:=0;
for i:=1 to m do if f[i]>ans then ans:=f[i];
writeln(ans);
close(input);
close(output);
end.
