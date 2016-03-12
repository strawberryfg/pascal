var i,j:longint;
    a:real;
begin
assign(input,'massage.in');
assign(output,'massage.out');
reset(input);
rewrite(output);
randomize;
readln(i);
for j:=1 to i do
    begin
    a:=random;
    if a>0.5 then writeln('T')
             else writeln('F');

    end;
close(input);
close(output);
end.