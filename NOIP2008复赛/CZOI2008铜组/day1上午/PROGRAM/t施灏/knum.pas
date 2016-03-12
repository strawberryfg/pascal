var a:array[1..100000] of longint;
    j,i,n,k,x:longint;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);
readln(n,k);
for i:=1 to n do
    read(a[i]);
for i:=1 to n-1 do
    for j:=i+1 to n do
	if a[i]<a[j] then begin
			  x:=a[i];
			  a[i]:=a[j];
			  a[j]:=x;
			  end;
writeln(a[k]);
close(input);
close(output);
end.
