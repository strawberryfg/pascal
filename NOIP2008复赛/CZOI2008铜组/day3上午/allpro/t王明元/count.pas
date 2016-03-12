var n,i,j,p,s:longint;
a:array[0..9]of longint;
begin
assign(input,'count.in');
reset(input);
assign(output,'count.out');
rewrite(output);
read(n);
for i:=1 to n do
	begin
	s:=i;
	while s<>0 do
		begin
		p:=s mod 10;
		s:=s div 10;
		case p of
			0:inc(a[0]);
			1:inc(a[1]);
			2:inc(a[2]);
			3:inc(a[3]);
			4:inc(a[4]);
			5:inc(a[5]);
			6:inc(a[6]);
			7:inc(a[7]);
			8:inc(a[8]);
			9:inc(a[9]);
			end;
		end;
	end;
for i:=0 to 9 do
	writeln(a[i]);
close(input);
close(output);
end.