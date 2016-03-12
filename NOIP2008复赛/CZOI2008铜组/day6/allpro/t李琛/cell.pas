var a:array[1..60,1..60] of char;
    sum,m,n,i,j:integer;
begin
  assign(input,'cell.in');
  reset(input);
  assign(output,'cell.out');
  rewrite(output);
  readln(m,n);
  for i:=1 to m do
   begin
    for j:=1 to n do
      read(a[i,j]);
    readln;
   end;
  sum:=0;
  for i:=1 to m do
    for j:=1 to n do
      if a[i,j]<>'0' then begin
      if (i=m) and (j<>1) and(j<>n) then if (a[i-1,j]<>'0') and (a[i,j-1]<>'0') and (a[i,j+1]<>'0') then sum:=sum+1;
      if (i=1) and (j<>1) and(j<>n) then if (a[i,j-1]<>'0') and (a[i+1,j]<>'0') and (a[i,j+1]<>'0') then sum:=sum+1;
      if (i<>m) and (j<>1) and(j<>n) and(i<>1) then if (a[i-1,j]<>'0') and (a[i,j-1]<>'0') and (a[i,j+1]<>'0') and(a[i+1,j]<>'0') then sum:=sum+1;
                        end;
  writeln(sum);
  close(input);
  close(output);
  end.
