var d,m,n,i,j,sum:longint;
h,a,l:array[1..1000] of longint;
begin
assign(input,'num.in');
reset(input);
assign(output,'num.out');
rewrite(output);
readln(n);
for i:=1 to n do
readln(a[i]);
fillchar(h[1],sizeof(h[i]),0);
fillchar(l[1],sizeof(l[i]),0);
for i:=2 to n do
	for j:=1 to i-1 do
		if a[i]<a[j] then h[i]:=h[i]+1;
for i:=1 to n-1 do
	for j:=i+1 to n do
		if a[i]<a[j] then l[i]:=l[i]+1;
sum:=0;
for i:=1 to n do
	if h[i]=l[i] then sum:=sum+1;
writeln(sum);
close(input);
close(output);
end.
