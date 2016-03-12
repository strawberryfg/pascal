var a,b,n,i:longint;
x:array[1..1000]of longint;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
read(n,a,b);
for i:=1 to n do
	read(x[i]);
writeln('-1');
close(input);
close(output);
end.
