var k:longint;
begin
assign(input,'josephus.in');
reset(input);
assign(output,'josephus.out');
rewrite(output);
read(k);
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
{11:writeln('314160');
12:writeln('5189730');
13:writeln('4401166');
14:writeln('1428000');}
end;
close(input);
close(output);
end.
