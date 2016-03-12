var t:boolean;
i,j,k,s,l:longint;
a:array[1..1000]of integer;
begin
assign(input,'primenum.in');
reset(input);
assign(output,'primenum.out');
rewrite(output);
t:=true;
s:=0;
i:=1;
while not eof do
  begin
  readln(a[i]);
  inc(i);
  end;
dec(i);
for k:=1 to i do
	begin
        for l:=1 to i do if a[k]=1 then inc(k)
				   else break;
	for j:=2 to 1000 do
		if (a[k] mod j=0)and(a[k]<>j) then begin t:=false;break;end;
	if t=true then inc(s);
	t:=true;
	end;
writeln(s);
close(input);
close(output);
end.
