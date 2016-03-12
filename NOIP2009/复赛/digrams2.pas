var i,j,k,n,tot,down:longint;
    should:array[1..100]of longint;
    f:array[0..100,-1..100]of longint;
begin
{assign(input,'diagrams.in');
reset(input);
assign(output,'diagrams.out');
rewrite(output);}
readln(n);
f[0,0]:=1; f[0,-1]:=1;
for i:=1 to n do should[i]:=i;
for i:=1 to n do
    begin
    if i=n then down:=1 else down:=0;
    for j:=i downto down do
        begin
        for k:=j downto 0 do
            inc(f[i,j],f[i-1,k]);
        if i=n then inc(tot,f[n,j]);
        end;
    end;
writeln(tot);
close(input);
close(output);
end.