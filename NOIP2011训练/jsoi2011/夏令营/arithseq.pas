const maxn=100020;
var n,d,i,fmax,j:longint;
    a,f:array[1..maxn]of longint;
function max(x,y:longint):longint;
begin
if x>y then exit(x) else exit(y);
end;
begin
assign(input,'arithseq.in');
reset(input);
assign(output,'arithseq.out');
rewrite(output);
readln(n,d);
for i:=1 to n do begin read(a[i]);f[i]:=1; end;
for i:=2 to n do
    begin
    fmax:=0;
    for j:=i-1 downto max(i-300,1) do
        begin
        if (a[i]-a[j]=d*(i-j))and(f[j]>fmax) then
            fmax:=f[j];
        end;
    f[i]:=fmax+1;
    end;
fmax:=0;
for i:=1 to n do if f[i]>fmax then fmax:=f[i];
writeln(n-fmax);
close(input);
close(output);
end.