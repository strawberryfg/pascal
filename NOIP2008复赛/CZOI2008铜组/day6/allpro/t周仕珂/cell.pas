var n,m,i:longint;
        s:array[1..10]of string;
begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
read(n,m);
for i:=1 to n do
        readln(s[i]);
writeln(n);
close(input);
close(output);
end.