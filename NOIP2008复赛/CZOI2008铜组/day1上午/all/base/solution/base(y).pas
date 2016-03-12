program bas;
var
  m,n,a,b,i,j,ii,total,s:longint;

function f(x,y:longint):boolean;
var
  t,i,j:longint;
  p:array[1..100] of longint;
begin
  t:=0;
  while x>0 do
  begin
    inc(t);
    p[t]:=x mod y;
    x:=x div y;
  end;
  i:=1;
  j:=t;
  while (i<j) and (p[i]=p[j]) do
  begin
    inc(i);
    dec(j);
  end;
  if i>=j
  then f:=true
  else f:=false;
end;

begin
  assign(input,'base.in');
  reset(input);
  assign(output,'base.out');
  rewrite(output);

  readln(m,n,a,b);
  total:=0;
  m:=trunc(sqrt(m));
  n:=trunc(sqrt(n));
  for i:=m to n do
  begin
    ii:=i*i;
    s:=0;
    for j:=a to b do
    begin
      if f(ii,j)
      then inc(s);
      if s>1
      then break;
    end;
    if s=1
    then inc(total);
  end;
  writeln(total);

  close(input);
  close(output);
end.
