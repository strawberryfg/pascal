var temp,i,j,n,k:longint;
a:array[1..10000]of longint;
begin
assign(input,'knum.in');
reset(input);
assign(output,'knum.out');
rewrite(output);
readln(n,k);
for i:=1 to n do
readln(a[i]);
for i:=1 to n do
for j:=i+1 to n do
begin
if a[i]<a[j] then begin
		temp:=a[i];
		a[i]:=a[j];
		a[j]:=temp;
		  end;
end;
writeln(a[k]);
close(input);
close(output);
end.
