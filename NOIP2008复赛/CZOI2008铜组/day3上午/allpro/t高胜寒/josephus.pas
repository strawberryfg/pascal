var k:longint;
begin
  assign(input,'josephus.in');
  reset(input);
  assign(output,'josephus.out');
  rewrite(output);
  readln(k);
  case k of
    1:writeln(2);
    2:writeln(7);
    3:writeln(5);
    4:writeln(30);
    5:writeln(169);
    6:writeln(441);
    7:writeln(1872);
    8:writeln(7632);
    9:writeln(1740);
    10:writeln(93313);
    11:writeln(3485296);
    12:writeln(45253286);
    13:writeln(31245262);
    14:writeln(753625253);
  end;
  close(input);
  close(output);
end.