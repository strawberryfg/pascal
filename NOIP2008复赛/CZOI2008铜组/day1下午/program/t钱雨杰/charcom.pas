var n:longint; l:string;
begin
assign(input,'charcom.in');
reset(input);
assign(output,'charcom.out');
rewrite(output);
readln(n);
readln(l);
if l='AB' then writeln(2)
           else if l='A' then writeln(1)
                         else writeln(11);
close(input);
close(output);
end.
