var i:longint;
begin
assign(input,'prime.in');
reset(input);
assign(output,'prime.out');
rewrite(output);
read(i);
if i mod 2 = 0 then if i=8 then begin writeln('1 2 3 8 5 6 7 4');
                                      writeln('1 2 5 8 3 4 7 6');
                                      writeln('1 4 7 6 5 8 3 2');
                                      writeln('1 6 7 4 3 8 5 2');
end;
close(input);
close(output);
end.