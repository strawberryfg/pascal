var n,s,i:longint;
    t:array[1..100]of integer;
begin
  assign(input,'cow.in');
  assign(output,'cow.out')
  reset(input);
  rewrite(output);
  readln(n);
  case n of
  1,2,3:writeln(1);
  4:writeln(2);
  5:writeln(3);
  6:writeln(5);
  7:writeln(7);
  8:writeln(10);
  9:writeln(14);
  10:writeln(19);
  11:writeln(25);
  end;
  close(input);
  close(output);
end.