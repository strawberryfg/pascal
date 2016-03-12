const a:array[1..26]of integer=(1,2,3,5,7,11,13,17,19,23,29,31,37,41,43,47,53,59,61,67,71,73,79,83,89,97);
var b:array[1..1000]of integer;
    i,j,k,s,m:integer;
begin
  assign(input,'primenum.in');
  reset(input);
  assign(output,'primenum.out');
  rewrite(output);
  i:=1;
  while not eof do
  begin
    readln(b[i]);
    inc(i);
  end;
  m:=0;
  for j:=1 to i do
    begin
      s:=0;
      for k:=1 to 26 do
        begin
          if b[j] mod a[k]<>0 then inc(s);
        end;
      if s=24 then inc(m);
    end;
  writeln(m);
  close(input);
  close(output);
end.