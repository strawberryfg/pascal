{
ID: xiaweiy1
PROG: inflate
LANG: PASCAL
}
const maxn=10200;
var m,n,i,fmax,j:longint;
    v,t,f:array[0..maxn]of longint;
begin
assign(input,'inflate.in');
reset(input);
assign(output,'inflate.out');
rewrite(output);
readln(m,n);

for i:=1 to n do
    begin
    readln(v[i],t[i]);   //value ,  time
    end;
fmax:=0;
for i:=1 to n do
    begin
    for j:=t[i] to m do
        begin
        if f[j-t[i]]+v[i]>f[j] then
           f[j]:=f[j-t[i]]+v[i];
        if f[j]>fmax then fmax:=f[j];
        end;
    end;
writeln(fmax);
close(input);
close(output);
end.