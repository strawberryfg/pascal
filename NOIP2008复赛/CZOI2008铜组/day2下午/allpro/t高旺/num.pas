var n,s,i,j,t1,t2:integer;
    a:array[1..1000] of integer;
begin
  assign(input,'num.in');
  reset(input);
  assign(output,'num.out');
  rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(a[i]);
  s:=0;
  for i:=1 to n do
    begin
      t1:=0;t2:=0;
      for j:=1 to i-1 do
        if a[j]>a[i] then t1:=t1+1;
      for j:=i+1 to n do
        if a[j]>a[i] then t2:=t2+1;
      if t1=t2 then s:=s+1;
    end;
  writeln(s);
  close(input);
  close(output);
end.
