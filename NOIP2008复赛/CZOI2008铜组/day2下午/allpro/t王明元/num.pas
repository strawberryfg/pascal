var a,b,c:array[1..1000] of longint;
i,j,k,n,s:longint;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
s:=0;
k:=1;
readln(n);
for i:=1 to n do
	readln(a[i]);
for i:=1 to n-1 do
	begin
	for j:=i to n do
		if a[j]>a[i] then inc(b[k]);
	inc(k);
	end;
k:=1;
for i:=n downto 2 do
	begin
	for j:=i downto 1 do
		if a[j]>a[i] then inc(c[k]);
	inc(k);
	end;
for i:=1 to n do
	if c[i]=b[i] then inc(s);
writeln(s);
close(input);
close(output);
end.