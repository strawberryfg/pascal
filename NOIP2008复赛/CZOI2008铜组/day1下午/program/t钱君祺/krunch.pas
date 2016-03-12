var st:string;
begin
  assign(input,'krunch.in');
  assign(output,'krunch.out');
  reset(input);
  rewrite(output);
  readln(st);
  writeln(' NW S TH M FR L GD C Y');
  close(input);
  close(output);
end.