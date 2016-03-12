var i,j,n:longint;
    a:array[1..200] of extended;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(n);
for i:=1 to 3 do
    a[i]:=1;
for i:=4 to n do
    a[i]:=a[i-1]+a[i-3];
writeln(trunc(a[n]));
close(input);
close(output);
end.
