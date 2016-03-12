var i,j,k,count:integer;
    pd:boolean;
    a:array[1..1000]of integer;
begin
  assign(input,'primenum.in');
  reset(input);
  assign(output,'primenum.out');
  rewrite(output);
  while not eof do
  begin
    inc(i);
    readln(a[i]);
  end;
  for j:=1 to i do
  begin
    pd:=true;
    for k:=2 to trunc(sqrt(a[j])) do
        if a[j] mod k=0 then begin pd:=false; break; end;
    if (pd=true)and(a[j]<>1) then count:=count+1;
  end;
  writeln(count);
  close(input);
  close(output);
end.
