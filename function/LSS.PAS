var s,i,t:longint;
function sum(n:longint):longint;
  var s,j:longint;
  begin
  s:=1;
  j:=1;
  for j:=2 to trunc(sqrt(n)) do
      if n mod j=0 then s:=s+j+n div j;
  if j*j=n then s:=s-j;
  sum:=s;
  end;
begin
for i:=2 to 10000 do
    begin
    t:=sum(i);
    if (sum(t)=i) and (i<t) then  writeln(i,' ',t);
    end;
end.