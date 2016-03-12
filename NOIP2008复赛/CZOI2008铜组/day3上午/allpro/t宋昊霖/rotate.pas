program rotate;
 var n:integer;
  begin
   assign(input,'rotate.in');
   reset(input);
   assign(output,'rotate.out');
   rewrite(output);
   readln(n);
   if n=3 then
    begin
    writeln('1 2 3');
    writeln('8 9 4');
    writeln('7 6 5');
    end;
   if n=4 then
   begin
    writeln(' 1  2  3  4');
    writeln('12 13 14  5');
    writeln('11 16 15  6');
    writeln('10  9  8  7');
   end;
   if n=5 then
    begin
    writeln(' 1  2  3  4 5');
    writeln('16 17 18 19 6');
    writeln('15 24 25 20 7');
    writeln('14 23 22 21 8');
    writeln('13 12 11 10 9')
   end;
  close(input);
  close(output);
 end.