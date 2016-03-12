program knum;
var  i,j,k,n,t:longint;
     a:array [1..100000]of longint;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);
readln(n,k);
for i:=1 to n do readln(a[i]);
for i:=1 to n-1 do
	for j:=i to n do
		if a[i]<a[j] then
				begin
				t:=a[i];
				a[i]:=a[j];
				a[j]:=t;
				end;
writeln(a[k]);
close(input);
close(output);
end.
