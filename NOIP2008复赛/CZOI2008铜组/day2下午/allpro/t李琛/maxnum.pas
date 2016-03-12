var gcd,min,i,j,s:integer;
    a:array[1..1000] of integer;
    f:boolean;
begin
assign(input,'maxnum.in');
reset(input);
assign(output,'maxnum.out');
rewrite(output);
s:=0;
while not eof do
begin
s:=s+1;
readln(s);
end;
min:=a[1];
for i:= 2 to s do
if a[i]<min then min:=a[i];
for j:= min downto 1 do
begin
for i:= 1to s do
if a[i]mod j<>0 then f:=false;
if f=true then  begin
                gcd:=j;
                break;
                end;

end;
writeln(gcd);
close(input);
close(output);
end.
