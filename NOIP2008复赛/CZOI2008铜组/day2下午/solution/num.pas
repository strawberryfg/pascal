program num;
var
  a:array[1..1000] of integer;
  n,i,j,t1,t2,sum:integer;

begin
  assign(input,'num.in');
  reset(input);
  assign(output,'num.out');
  rewrite(output);

  readln(n);
  for i:=1 to n do
    readln(a[i]);
  sum:=0;
  for i:=1 to n do
  begin
    t1:=0;
    for j:=1 to i-1 do
      if a[i]<a[j]
      then inc(t1);
    t2:=0;
    for j:=i+1 to n do
      if a[i]<a[j]
      then inc(t2);
    if t1=t2
    then inc(sum);
  end;
  writeln(sum);

  close(input);
  close(output);
end.
