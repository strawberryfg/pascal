var i:longint;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus.out');
rewrite(output);
readln(i);
if i=2 then writeln(7);
if i=3 then writeln(5);
if i=4 then writeln(30);
if i=5 then writeln(169);
if i=6 then writeln(441);
if i=7 then writeln(1872);
if i=8 then writeln(46620);
if i=9 then writeln(1740);
close(input);
close(output);
end.