var a:array[1..1001]of integer;
    n,i,t,temp:integer;
begin
  assign(input,'maxnum.in' );
  reset(input);
  assign(output,'maxnum.out');
  rewrite(output);
  n:=0;
  while not eof do
  begin
    inc(n);
    readln(a[n]);
  end;
  for i:=1 to (n-1) do
  begin
    if a[i]<a[i+1] then begin temp:=a[i];a[i]:=a[i+1];a[i+1]:=temp; end;
    t:=a[i] mod a[i+1];
    while t>0 do
    begin
    a[i]:=a[i+1];
    a[i+1]:=t;
    t:=a[i] mod a[i+1];
    end;
  end;
  writeln(a[n]);
  close(input);
  close(output);
end.
