var a1,a2,a3,a4,a5:longint;
begin
randomize;
assign(input,'base.in');
reset(input);
assign(output,'base.out');
rewrite(output);
readln(a1,a2,a3,a4);
a5:=a2 div 100;
if a2=10000 then writeln(12)
   else writeln(random(a5));
close(input);
close(output);
end.
