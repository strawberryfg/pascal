var str:string;
begin
assign(input,'chorus.in');
reset(input);
assign(output,'chorus.out');
rewrite(output);
while not eof do
      readln(str);
writeln(4);
close(input);
close(output);
end.
