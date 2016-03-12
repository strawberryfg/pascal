var s,t:integer;
begin
assign(input,'car.in');
assign(output,'car.out');
reset(input);
rewrite(output);
readln(s,t);
if s<=10 then writeln(s/90:0:2)
   else if s<=20 then writeln(s/90:0:2)
        else if s<=30  then writeln(s/80:0:2)
             else if s<=40 then writeln(s/75:0:2) else writeln(s/70:0:2);
close(input);
close(output);
end.
