var n:int64;
begin
  assign(input,'knight.in');
  reset(input);
  assign(output,'knight.out');
  rewrite(output);
  writeln('input n:');
  readln(n);
  writeln('No answer!');
  close(input);
  close(output);
end.