var str,st:string;
i,j,k,t:longint;
a:array[1..250]of string;
b:array[1..250]of integer;
begin
assign(input,'mystring.in');
reset(input);
assign(output,'mystring.out');
rewrite(output);
i:=1;
j:=1;
readln(str);
while length(str)<>i-1 do
if str[i]<>' ' then begin a[j]:=a[j]+str[i];inc(i);end
		else begin inc(j);inc(i);end;
for k:=1 to j do
	b[k]:=length(a[k]);
for i:=1 to j do
	for k:=i to j do
		if b[i]<b[k] then begin t:=b[i];b[i]:=b[j];b[j]:=t;
					st:=a[i];a[i]:=a[j];a[j]:=st;end;
writeln(a[1]);
writeln(a[j]);
close(input);
close(output);
end.