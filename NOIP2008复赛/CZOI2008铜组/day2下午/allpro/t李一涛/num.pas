var a:array[1..1000]of integer;
    s,s1,s2,i,j,n:integer;
begin
  assign(input,'num.in');
  reset(input);
  assign(output,'num.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do readln(a[i]);
  s:=0;
  for i:=2 to n do
  begin
    s1:=0; s2:=0;
    for j:=1 to i-1 do
    begin
      if a[j]>a[i] then inc(s1);
    end;
    for j:=i+1 to n do
    begin
      if a[j]>a[i] then inc(s2);
    end;
    if s1=s2 then inc(s);
  end;
  writeln(s);
  close(input);
  close(output);
end.
