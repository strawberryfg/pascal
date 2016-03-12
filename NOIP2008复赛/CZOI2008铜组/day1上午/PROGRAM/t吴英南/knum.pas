const maxn=10000;
var max,i,n,k,l,j:longint;
    a:array[1..maxn]of longint;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);
read(n,k);
for i:=1 to n do
    read(a[i]);
for i:=1 to k do
    begin
        max:=a[1];
        for j:=1 to n do
            if a[j]>max then begin max:=a[j]; l:=j; end;
        a[l]:=-40000;
    end;
writeln(max);
close(input);
close(output);
end.