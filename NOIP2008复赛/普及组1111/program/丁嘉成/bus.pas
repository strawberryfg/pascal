var n:longint;
begin
assign(input,'bus.in');
reset(input);
assign(output,'bus.out');
rewrite(output);
readln(n);
writeln(n div 5);
close(input);
close(output);
end.