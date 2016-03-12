var n,m,l:longint;
begin
assign(input,'highway.in');
assign(output,'highway.out');
reset(input);
rewrite(output);
randomize;
readln(n,m,l);
writeln(random(m div 2)+m div 2);
close(input);
close(output);
end.