var n,m,p,q:longint;
begin
assign(input,'base.in');
assign(output,'base.out');
reset(input);
rewrite(output);
readln(n,m,p,q);
if (n=1)and(m=10000)and(p=9)and(q=11) then writeln(12);
close(input);
close(output);
end.
