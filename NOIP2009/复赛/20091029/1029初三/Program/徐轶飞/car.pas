var a,b:longint;
begin
assign(input,'car.in');
assign(output,'car.out');
reset(input);
rewrite(output);
readln(a,b);
writeln(a/b:0:2);
close(input);
close(output);
end.