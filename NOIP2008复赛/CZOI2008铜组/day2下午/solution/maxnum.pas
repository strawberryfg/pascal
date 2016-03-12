program maxnum;
var
  a:array[1..1000] of integer;
  t,p,i:integer;

function gcd(x,y:integer):integer;
var
  r:integer;
begin
  r:=x mod y;
  while r<>0 do
  begin
    x:=y;
    y:=r;
    r:=x mod y;
  end;
  gcd:=y;
end;

begin
  assign(input,'maxnum.in');
  reset(input);
  assign(output,'maxnum.out');
  rewrite(output);

  t:=0;
  while not eof do
  begin
    inc(t);
    readln(a[t]);
  end;

  p:=gcd(a[1],a[2]);
  for i:=3 to t do
    p:=gcd(p,a[i]);
  writeln(p);

  close(input);
  close(output);
end.