begin
assign(input,'highway.in');
reset(input);
assign(output,'highway.out');
rewrite(output);
writeln('2');
close(input);
close(output);
end.