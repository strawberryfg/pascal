program fire;
var a:array[1..10,1..10]of char;
    n,d1,d2,k,i,j:integer;
begin
  assign(input,'fire.in');
  reset(input);
  assign(output,'fire.out');
  rewrite(output);
  readln(n);
  for i:=1 to n+1 do
      for j:=1 to n do
        read(a[i,j]);
  for d1:=1 to n do
    for d2:=1 to n do
      begin
        if (a[d1,d2]<>'x') and (a[d1,d2]<>'w') then begin
                                                      a[d1,d2]:='t';
                                                      i:=d2;
                                                      for j:=i-1 downto 1 do if a[d1,j]<>'x' then a[d1,j]:='w' else i:=1;
                                                      for j:=i-1 downto 1 do if a[j,d2]<>'x' then a[j,d2]:='w' else i:=1;
                                                      for j:=i+1 to n do if a[d1,j]<>'x' then a[d1,j]:='w' else i:=n;
                                                      for j:=i+1 to n do if a[j,d2]<>'x' then a[j,d2]:='w' else i:=n;
                                                    end;

      end;
  k:=0;
  for i:=1 to n do
    for j:=1 to n do
      if a[i,j]='t' then inc(k);

  writeln(k);

  close(input);
  close(output);
end.
