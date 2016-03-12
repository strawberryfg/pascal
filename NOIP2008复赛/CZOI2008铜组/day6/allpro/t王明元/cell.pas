var i,j,n,m:longint;
a:array[1..60,1..60]of longint;
begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
	for j:=1 to m do
		read(a[i,j]);
writeln(n);
close(input);
close(output);
end.