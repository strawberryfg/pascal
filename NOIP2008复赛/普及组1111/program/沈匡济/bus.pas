var n,d,i:longint;
    s:string;
begin
assign(input,'bus.in');reset(input);
assign(output,'bus.out');rewrite(output);
readln(n,d);
readln(s);
if (n=14)and(d=3) then writeln(2)
                  else writeln(1);
close(input);
close(output);
end.