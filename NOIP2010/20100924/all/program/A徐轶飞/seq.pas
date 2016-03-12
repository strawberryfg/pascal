var a:array[1..100000]of longint;
    n,j,k,i:longint;
begin
assign(input,'seq.in');
assign(output,'seq.out');
reset(input);
rewrite(output);
readln(n);
readln(a[1]);
k:=maxlongint;
for i:=2 to n do
    begin
    readln(a[i]);
    j:=a[i]-a[i-1];
    if j<k then k:=j;
    end;
if k<0 then k:=-1;
writeln(k+1);
close(input);
close(output);
end.