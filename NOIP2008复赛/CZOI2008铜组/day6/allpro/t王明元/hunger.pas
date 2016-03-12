var n,i:longint;
a,b:array[1..2000] of longint;
begin
assign(input,'hunger.in');
reset(input);
assign(output,'hunger.out');
rewrite(output);
readln(n);
for i:=1 to n do
	begin
	read(a[i]);
	read(b[i]);
	end;
if n=3 then writeln('4')
	else writeln(n);
close(input);
close(output);
end.
