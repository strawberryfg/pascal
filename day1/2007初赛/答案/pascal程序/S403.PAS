program S403;
var a1:array[1..50] of integer;
var i,j,t,t2,n,n2:integer;
begin
 n:=50;
 for i:=1 to n do a1[i]:=0;
 n2:=round(sqrt(n));
 for i:=2 to n2 do
  if(a1[i]=0) then
    begin
      t2:=n div i;
      for j:=2 to t2 do a1[i*j]:=1;
    end;
  t:=0;
  for i:=2 to n do
  if (a1[i]=0) then
    begin
      write(i:4);  inc(t);
      if(t mod 10=0) then writeln;
    end;
  writeln;
 end.

