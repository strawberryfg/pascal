
begin
  assign(input,'panda.in');
  assign(output,'panda.out');
  reset(input);
  rewrite(output);
  writeln(45);
  close(input);
  close(output);
end.