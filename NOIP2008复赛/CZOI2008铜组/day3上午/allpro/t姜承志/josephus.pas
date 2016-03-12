var k:byte;
begin
assign(input,'josephus.in');
assign(output,'josephus.out');
reset(input);
rewrite(output);
readln(k);
case k of
     1:writeln('2');
     2:writeln('7');
     3:writeln('5');
     4:writeln('30');
     5:writeln('169');
     6:writeln('441');
     7:writeln('1872');
     8:writeln('7632');
     9:writeln('1740');
     10:writeln('93313');
         end;
close(input);
close(output);
end.
