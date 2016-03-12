program primenum;
var
  a:array[1..1000] of integer;
  t,i,sum:integer;

function test(x:integer):boolean;
var
  y:integer;
begin
  y:=2;
  while (x mod y<>0) and (y<=trunc(sqrt(x))) do
    inc(y);
  if y>trunc(sqrt(x))
  then test:=true
  else test:=false;
end;

begin
  assign(input,'primenum.in');
  reset(input);
  assign(output,'primenum.out');
  rewrite(output);

  t:=0;
  while not eof do
  begin
    inc(t);
    readln(a[t]);
  end;
  sum:=0;
  for i:=1 to t do
    if (a[i]>1) and test(a[i])
    then inc(sum);
  writeln(sum);

  close(input);
  close(output);
end.
