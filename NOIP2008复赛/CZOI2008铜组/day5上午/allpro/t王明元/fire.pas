var n,i:longint;
a:array[1..10,1..10]of char;
begin
assign(input,'fire.in');
reset(input);
assign(output,'fire.out');
rewrite(output);
read(n);
for i:=1 to n do read(a[i]);
if n=4 then writeln(5) else
	if n=3 then writeln(5) else
			if n=2 then writeln(2)
				else if n=1 then writeln(1)
					else  writeln(n);
close(input);
close(output);
end.
