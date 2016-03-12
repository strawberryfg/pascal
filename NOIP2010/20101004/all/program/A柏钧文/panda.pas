var n,k,i:longint;
        a:array[1..10000]of longint;
begin
assign(input,'panda.in');
reset(input);
assign(output,'panda.out');
rewrite(output);
readln(n,k);
for i:=1 to n do
        read(a[i]);
writeln(a[1]*a[1]*a[2]);
close(input);
close(output);
end.