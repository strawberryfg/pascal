var a:array[1..1001]of integer;
    i,j,k,t1,t2,tt,n:longint;
begin
  assign(input,'num.in');
  reset(input);
  assign(output,'num.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
  readln(a[i]);
  tt:=0;
  for i:=1 to n do
  begin
    t1:=0;t2:=0;
    for j:=n downto i+1 do
    begin
      if a[j]>a[i] then inc(t1);
    end;
    for k:=1 to (i-1) do
    begin
      if a[k]>a[i] then inc(t2);
    end;
    if t1=t2 then inc(tt);
  end;
  writeln(tt);
  close(input);
  close(output);
end.
