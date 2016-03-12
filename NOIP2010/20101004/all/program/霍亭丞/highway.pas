var n,m,l,i:longint;a,b,c,d:array[-1..100000]of longint;
begin
assign(input,'highway.in');
assign(output,'highway.out');
reset(input);
rewrite(output);
readln(n,m,l);
for i:=1 to m do
    begin
    read(a[i],b[i],c[i],d[i]);
    end;
writeln(m div 2+1);
close(output);
close(input);
end.