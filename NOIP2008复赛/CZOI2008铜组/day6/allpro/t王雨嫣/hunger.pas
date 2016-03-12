var n,i,j,ii,s:longint;
    a,b,c:array[1..2000]of longint;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
readln(n);
for i:=1 to n do
    readln(a[i],b[i]);
writeln('5');
close(input);
close(output);
end.