var
	cc:char;
	i,j,k,t,n,m:longint;
	c:array[1..100] of char;
	f:array[1..100] of longint;
begin
	assign(input,'kolone.in');
	reset(input);
	assign(output,'kolone.out');
	rewrite(output);
	readln(n,m);
	fillchar(f,sizeof(f),0);
	for i:=n downto 1 do
		read(c[i]);
	readln;
	for i:=n+1 to n+m do
	begin
		read(c[i]);
		f[i]:=1;
	end;
	readln(t);
	for i:=1 to t do
	begin
		j:=1;
		while j<n+m do
		begin
			if f[j]>=f[j+1] then
			begin inc(j);continue end;
			cc:=c[j];c[j]:=c[j+1];c[j+1]:=cc;
			k:=f[j];f[j]:=f[j+1];f[j+1]:=k;
			inc(j,2);
		end;
	end;
	for i:=1 to n+m do
		write(c[i]);
	writeln;
	close(input);
	close(output);
end.
