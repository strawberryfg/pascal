var n,k,i,j,s,t,m:longint;
    a,c:array[1..100000] of integer;
    b:array[-32768..32767] of integer;
begin
  assign(input,'knum.in');
  reset(input);
  assign(output,'knum.out');
  rewrite(output);
  read(n,k);
  for i:=1 to n do
    readln(a[i]);
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if a[i]<a[j] then begin t:=a[i];a[i]:=a[j];a[j]:=t end;
  for i:=1 to n do
    b[a[i]]:=1;
  m:=0;
  for i:=32767 downto -32768 do
    if b[i]<>0 then begin m:=m+1;c[m]:=i end;
  write(c[k]);
  close(input);
  close(output);
end.
