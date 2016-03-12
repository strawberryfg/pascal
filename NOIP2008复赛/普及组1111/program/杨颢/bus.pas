var n,d,j,h,i:longint;
    s:char;
begin
assign(input,'bus.in');
assign(output,'bus.out');
reset(input);
rewrite(output);
readln(n,d);
for i:=1 to n do
   begin
    read(s);
    if s='H' then inc(h);
    if s='J' then inc(j);
   end;
if abs(h-j)<=d then writeln(1)
               else writeln(2);
close(input);
close(output);
end.