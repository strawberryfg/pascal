var a:array[0..9]of longint;
    i,j,m,n,k:longint;
begin
  assign(input,'count.in');
  reset(input);
  assign(output,'count.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
  begin
    j:=i;
    while j<>0 do
    begin
      k:=j mod 10; j:=j div 10;
      inc(a[k]);
    end;
  end;
  for i:=0 to 9 do writeln(a[i]);
  close(input);
  close(output);
end.
