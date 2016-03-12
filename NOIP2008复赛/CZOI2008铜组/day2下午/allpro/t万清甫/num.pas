const maxn=1000;
var i,j,k,left,right,sum,n:longint;
    a:array[1..maxn]of integer;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(n);
for i:=1 to n do
    readln(a[i]);
for j:=1 to n do
    begin
    left:=0; right:=0;
    for k:=1 to j-1 do if a[k]>a[j] then inc(left);
    for k:=j+1 to n do if a[k]>a[j] then inc(right);
    if left=right then inc(sum);
    end;
writeln(sum);
close(input);
close(output);
end.