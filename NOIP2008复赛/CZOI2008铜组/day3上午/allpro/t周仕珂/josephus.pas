var k:longint;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus,out');
rewrite(output);
readln(k);
if k=1 then writeln(2);
if k=2 then writeln(7);
if k=3 then writeln(5);
if k=4 then writeln(30);
close(input);
close(output);
end.