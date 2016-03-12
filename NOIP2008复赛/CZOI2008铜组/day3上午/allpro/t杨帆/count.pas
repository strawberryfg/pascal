var n,i,t,b:longint;
    a:array[0..9] of longint;
begin
  assign(input,'count.in');
  reset(input);
  assign(output,'count.out');
  rewrite(output);
  readln(n);
  for i:=0 to 9 do
      a[i]:=0;
  for i:=1 to n do
      begin
      t:=i;
      while t<>0 do
            begin
            b:=t mod 10;
            inc(a[b]);
            t:=t div 10;
            end;
      end;
  for i:=0 to 9 do
      writeln(a[i]);
  close(input);
  close(output);
end.
