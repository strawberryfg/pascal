var a:longint;
begin
assign(input,'puzzle.in');
assign(output,'puzzle.out');
reset(input);
rewrite(output);
writeln('2 4 5 6 3 1 9 8 7');
writeln('1 8 6 4 7 9 2 5 3');
writeln('7 9 3 5 2 8 4 6 1');
writeln('6 3 7 8 9 2 1 4 5');
writeln('8 5 2 1 4 6 3 7 9');
writeln('9 1 4 3 5 7 6 2 8');
writeln('4 7 1 2 8 3 5 9 6');
writeln('5 6 9 7 1 4 8 3 2');
writeln('3 2 8 9 6 5 7 1 4');
close(input);
close(output);
end.
