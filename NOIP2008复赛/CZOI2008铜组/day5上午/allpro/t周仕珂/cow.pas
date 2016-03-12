var i,k:longint;
        a:array[1..200] of int64;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(k);
for i:=1 to 3 do
        a[i]:=1;
for i:=4 to k do
        a[i]:=a[i-1]+a[i-3];
writeln(a[k]);
close(input);
close(output);
end.
