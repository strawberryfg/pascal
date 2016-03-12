var a,b,c,d,i,j,k:longint;
v:array[1..70]of char;
s:array[1..26] of char;


begin
assign(input,'krunch.in');
reset(input);
assign(output,'krunch.out');
rewrite(output);
i:=0;
while not eoln do
begin
inc(i);
read(v[i]);
end;
a:=i;
for j:=1 to a do
begin
if (v[j]='A') or (v[j]='E') or
(v[j]='I') or (v[j]='O') or (v[j]='U') then
        begin
        for i:=j to a-1 do
        v[i]:=v[i+1];
        dec(a);
        end;
end;
for i:=1 to a do
for j:=i+1 to a do
if v[j]=v[i] then
	begin
	for k:=j to a-1 do
	v[i]:=v[i+1];
        dec(a);
        end;
for j:=1 to a do
write(v[j]);
writeln;
close(input);
close(output);
end.
