program ex4;
var
  i,j,n,len,max:longint;
  a,b,c:array[1..100] of integer;
begin
  assign(input,'work4.in');
  reset(input);
  assign(output,'work4.out');
  rewrite(output);

  readln(n);
  for i:=1 to n do
    read(a[i]);

  for i:=1 to n do
  begin
    b[i]:=1;
    c[i]:=1;
  end;

  for i:=2 to n do
  begin
    len:=0;
    for j:=1 to i-1 do
      if (a[i]>a[j]) and (b[j]>len)
      then len:=b[j];
    if len>0
    then b[i]:=len+1;
  end;

  for i:=n-1 downto 1 do
  begin
    len:=0;
    for j:=n downto i+1 do
      if (a[i]>a[j]) and (c[j]>len)
      then len:=c[j];
    if len>0
    then c[i]:=len+1;
  end;

  max:=0;
  for i:=1 to n do
    if b[i]+c[i]-1>max
    then max:=b[i]+c[i]-1;

  writeln(n-max);
  close(input);
  close(output);
end.