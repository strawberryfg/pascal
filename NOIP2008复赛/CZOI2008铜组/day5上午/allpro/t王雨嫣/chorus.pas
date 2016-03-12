var n,m,i:longint;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
readln(n);
for i:=1 to n do
    readln(m);
writeln(n div 2);
close(input);
close(output);
end.