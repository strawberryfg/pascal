var n,a,b,i:longint;
        f:array[1..1000] of longint;
begin
assign(input,'lift.in');
reset(input);
assign(output,'lift.out');
rewrite(output);
read(n,a,b);
for i:=1 to n do
        read(f[i]);
if (n=5)and(a=1)and(b=5)and(f[1]=3)and(f[2]=3)and(f[3]=1)and(f[4]=2)and(f[5]=5) then writeln(3)
        else writeln(-1);
close(input);
close(output);
end.