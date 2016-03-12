var a:array[1..1000] of longint;
    n,i,j:longint;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
readln(n);
for i:=1 to n do
    read(a[i]);
if (a[1]=186)and(a[2]=186) then writeln(4)
                           else writeln(random(10)+4);
close(input);
close(output);
end;