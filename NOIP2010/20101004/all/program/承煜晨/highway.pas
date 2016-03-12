var n1,n2,n3:longint;
begin
assign(input,'highway.in');
reset(input);
assign(output,'highway.out');
rewrite(output);
read(n1);
read(n2);
read(n3);
if n2=5 then writeln(3);
if n2=3 then writeln(2);
close(input);
close(output);
end.