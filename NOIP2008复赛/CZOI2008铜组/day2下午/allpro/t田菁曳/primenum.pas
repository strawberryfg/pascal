var a:array[1..1001]of integer;
    i,n,j,t,c:integer;
    f:boolean;
begin
  assign(input,'primenum.in');
  reset(input);
  assign(output,'primenum.out');
  rewrite(output);
  n:=0;
  t:=0;
  c:=0;
  while not eof do
  begin
    inc(n);
    readln(a[n]);
  end;
  for i:=1 to n do
  begin
  begin
    if a[i]=1 then c:=c+1;
  end;
    f:=true;
    for j:=2 to a[i]-1 do
      if (a[i] mod j=0)and(a[i]<>2)then f:=false;
    if f then inc(t);
  end;
  writeln(t-c);
  close(input);
  close(output);
end.
