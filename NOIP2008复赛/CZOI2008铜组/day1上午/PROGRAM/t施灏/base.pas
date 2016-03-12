var a,b,c,d,i,j,s:longint;
    h:array[1..10000000] of integer;
    y:array[1..10000000] of longint;
begin
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
read(a,b,c,d);
j:=0;
for i:=a to b do
    y[i]:=i;
for i:=c to d do
    repeat
    j:=j+1;
    h[j]:=y[i] mod i;
    y[i]:=y[i] div i;
    until y[i]=0;
for i:=j downto 1 do
    h[i]:=y[i];
s:=0;
for i:=1 to j do
    if h[i]=y[i] then inc(s);
writeln(2*s);
close(input);
close(output);
end.
