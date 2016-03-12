var a:longint;
begin
assign(input,'cell.in');
reset(input);
assign(output,'cell.out');
rewrite(output);
read(a);
writeln(a);
close(input);
close(output);
end.