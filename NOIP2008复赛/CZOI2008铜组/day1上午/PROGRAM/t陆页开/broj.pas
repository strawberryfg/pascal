var n:longint;
begin
assign(input,'broj.in');
reset(input);
assign(output,'broj.out');
rewrite(output);
readln(n);
if n<10 then writeln(n)
        else if n<100 then writeln(2*n-9)
                      else if n<1000 then writeln(3*n-108)
                                     else if n<10000 then writeln(4*n-1107)
                                                     else if n<100000 then writeln(5*n-11106)
                                                                      else if n<1000000 then writeln(6*n-111105)
                                                                                        else if n<10000000 then writeln(7*n-1111104)
                                                                                                           else if n<100000000 then writeln(8*n-11111103)
                                                                                                                               else writeln('788888898');
close(input);
close(output);
end.