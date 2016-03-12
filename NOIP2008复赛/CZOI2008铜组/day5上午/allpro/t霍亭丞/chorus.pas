var i,n,s:longint;
begin
assign(input,'chorus.in');
assign(output,'chorus.out');
reset(input);
rewrite(output);
readln(n);
for i:=1 to n do
    readln(s);
writeln(n div 2);
close(input);close(output);
end.