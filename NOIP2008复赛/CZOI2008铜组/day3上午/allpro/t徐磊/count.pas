var a:array[0..9]of longint;
    i,temp,n:longint;
begin
  assign(input,'count.in');reset(input);
  assign(output,'count.out');rewrite(output);
  readln(n);
  for i:=1 to n do
  begin
    temp:=i;
    while temp<>0 do
    begin
      inc(a[temp mod 10]);
      temp:=temp div 10;
    end;
  end;
  for i:=0 to 9 do writeln(a[i]);
  close(input);close(output);
end.
