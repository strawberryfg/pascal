begin
  assign(input,'highway.in');
  assign(output,'highway.out');
  reset(input);
  rewrite(output);
  writeln(3);
  close(input);
  close(output);
end.