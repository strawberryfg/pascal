var s:longint;
    k,i,j,max:integer;
    a:array[1..1000]of integer;
    pd:boolean;
begin
  assign(input,'maxnum.in');
  reset(input);
  assign(output,'maxnum.out');
  rewrite(output);
  s:=maxlongint;
  while not eof do
  begin
    inc(i);
    readln(a[i]);
    if a[i]<s then s:=a[i];
  end;
  max:=1;
  for j:=2 to s do
  begin
    pd:=true;
    for k:=1 to i do
        if a[k]mod j<>0 then begin pd:=false; break; end;
    if pd=true then max:=j;
  end;
  writeln(max);
  close(input);
  close(output);
end.