var a,b:array[1..1000]of integer;
i,j,k,t,l:longint;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
l:=1;
i:=1;
while not eof do
  begin
  readln(a[i]);
  inc(i);
  end;
dec(i);
for j:=1 to i-1 do
	for k:=j to i do
		if a[j]<a[k] then begin t:=a[j];a[j]:=a[k];a[k]:=t;end;
for k:=1 to i-1 do
	for j:=1 to a[i] do
		if a[k] mod j=0 then begin b[l]:=j;inc(l);end
				else b[l]:=0;
for j:=1 to i-1 do
	for k:=j to i do
		if b[j]<b[k] then begin t:=b[j];b[j]:=b[k];b[k]:=t;end;
writeln(b[1]);
close(input);
close(output);
end.
