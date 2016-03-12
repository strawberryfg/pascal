var str1,str2:string;
a,b:array[1..3]of string;
c,d,e:array[1..3]of longint;
i,j,k:longint;
begin
assign(input,'natrij.in');
reset(input);
assign(output,'natrij.out');
rewrite(output);
k:=1;
readln(str1);
readln(str2);
for i:=1 to length(str1) do
	begin
	if str1[i]<>':' then a[k]:=a[k]+str1[i]
			else inc(k);
	end;
k:=1;
for i:=1 to length(str2) do
	begin
	if str2[i]<>':' then b[k]:=b[k]+str2[i]
			else inc(k);
	end;
for i:=1 to 3 do
	begin
	val(a[i],c[i]);
	val(b[i],d[i]);
	end;
if d[1]<c[1] then d[1]:=d[1]+24;
for i:=3 downto 1 do
        begin
	if d[i]<c[i] then begin d[i]:=d[i]+60;dec(d[i-1]);end;
	e[i]:=d[i]-c[i];
        end;
for i:=1 to 3 do
	if e[i]<10 then
			begin write('0',e[i]);
				if i<3 then write(':')
			end
		   else
			begin write(e[i]);
				if i<3 then write(':');end;
close(input);
close(output);
end.
