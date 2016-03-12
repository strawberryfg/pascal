var n,i,t,k:longint;
    a:array[0..9] of longint;
procedure setup;
  begin
  assign(input,'count.in');
  reset(input);
  assign(output,'count.out');
  rewrite(output);
  end;
procedure endit;
  begin
  close(input);
  close(output);
  end;
procedure work;
  begin
  for i:=0 to 9 do
      a[i]:=0;
  for i:=1 to n do
      begin
      t:=i;
      while t<>0 do
            begin
            k:=t mod 10;
            inc(a[k]);
            t:=t div 10;
            end;
      end;
  for i:=0 to 9 do
      writeln(a[i]);
  end;
begin
setup;
readln(n);;
work;
endit;
end.
