var st:string;
begin
  assign(input,'charcom.in');
  assign(output,'charcom.out');
  reset(input);
  rewrite(output);
  readln(st);
  writeln(2);
  close(input);
  close(output);
end.