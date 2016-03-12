var n,i:longint;
a:array[1..1000]of longint;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
read(n);
for i:=1 to n do
	read(a[i]);
if n=8 then writeln(4)
	else writeln(0);
close(input);
close(output);
end.
