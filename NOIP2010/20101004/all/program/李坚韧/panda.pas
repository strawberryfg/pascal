var
  n,k,i,j,min,na:longint;
  x,y:Array[0..100] of longint;
  d:Array[0..500000] of longint;
begin
  assign(input,'panda.in');
  reset(input);
  assign(output,'panda.out');
  rewrite(output);


  read(n,k);

  for i:=1 to n do
  begin
    read(x[i]);
    y[i]:=0;
  end;

  d[0]:=1;

  for i:=1 to k do
  begin
    min:=maxlongint;

    for j:=1 to n do
      if (d[y[j]]*x[j]>d[i-1]) then
      begin
        if (d[y[j]]*x[j]<min) then
        begin
          min:=d[y[j]]*x[j];
          na:=y[j];
        end;
      end
      else
        inc(y[j]);

    d[i]:=min;
    inc(y[na]);
  end;

  {for i:=1 to k do
    writeln(d[i]);}

  writeln(d[k]);

  close(input);
  close(output);
end.
