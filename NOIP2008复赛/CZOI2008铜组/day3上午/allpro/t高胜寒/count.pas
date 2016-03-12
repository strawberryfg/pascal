var n,i,s:longint;
    a:array[0..9]of longint;
begin
  assign(input,'count.in');
  reset(input);
  assign(output,'count.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
  begin
    s:=i;
    while s<>0 do
    begin
      inc(a[s mod 10]);
      s:=s div 10;
    end;
  end;
  for i:=0 to 9 do
    writeln(a[i]);
  close(input);
  close(output);
end.