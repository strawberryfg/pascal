var
	i,j,s1,s2,n,d:longint;
	f:array[0..2500] of longint;
	c:array[0..2500] of char;
begin
	assign(input,'bus.in');
	reset(input);
	assign(output,'bus.out');
	rewrite(output);
	readln(n,d);
	for i:=1 to n do
		read(c[i]);
	f[1]:=1;
	for i:=2 to n do
	begin
		s1:=0;s2:=0;
		f[i]:=f[i-1]+1;
		for j:=i downto 1 do
		begin
			if c[j]='J' then inc(s2) else inc(s1);
			if ((abs(s1-s2)<=d) or (s1*s2=0)) and (f[j-1]+1<f[i])
				then f[i]:=f[j-1]+1;
		end;
	end;
	writeln(f[n]);
	close(input);
	close(output);
end.
