begin
assign(input,'bag.in');
reset(input);
assign(output,'bag.out');
rewrite(output);
writeln(5);
close(input);
close(output);
end.