var n,i,j,p,q:longint;
	a:array[1..1000] of string;
begin
        assign(input,'fire.in');
	reset(input);
	assign(output,'fire.out');
	rewrite(output);
        readln(n);
	for i:=1 to n do
	for j:=1 to n do
	read(a[i,j]);




	if p<=q then writeln(p)
		else writeln(q);    		

	close(input);
	close(output);
end.
