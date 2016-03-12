program chorus;
var
  a,b,c:array[1..100] of integer;
  max,n,i,j:integer;

begin
  assign(input,'chorus.in');
  reset(input);
  assign(output,'chorus.out');
  rewrite(output);

  readln(n);
  for i:=1 to n do
    read(a[i]);
  b[1]:=1;
  for i:=2 to n do
  begin
    b[i]:=1;
    for j:=1 to i-1 do
      if (a[i]>a[j]) and (b[i]<=b[j])
      then b[i]:=b[j]+1;
  end;

  c[n]:=1;
  for i:=n-1 downto 1 do
  begin
    c[i]:=1;
    for j:=i+1 to n do
      if (a[i]>a[j]) and (c[i]<=c[j])
      then c[i]:=c[j]+1;
  end;

  max:=0;
  for i:=1 to n do
    if (b[i]+c[i]-1)>max
    then max:=b[i]+c[i]-1;
  writeln(n-max);

  close(input);
  close(output);
end.
