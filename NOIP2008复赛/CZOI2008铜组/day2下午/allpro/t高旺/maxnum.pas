var a:array[1..10000] of integer;
    i,j,n:integer;
begin
  assign(input,'maxnum.in');
  reset(input);
  assign(output,'maxnum.out');
  rewrite(output);
  for i:=1 to 10000 do a[i]:=0;
  j:=0;
  while not eof do
    begin
      readln(n);
      j:=j+1;
      for i:=1 to n do
        if n mod i=0 then a[i]:=a[i]+1;
    end;
  for i:=10000 downto 1 do
    if a[i]=j then begin
                      writeln(i);
                      break;
                    end;
  close(input);
  close(output);
end.