var s,i,t:longint;
function wqs(n:longint):longint;
  var s,i:longint;
  begin
  s:=1;
  i:=1;
  for i:=2 to trunc(sqrt(n)) do
      if n mod i=0 then s:=s+i+n div i;
  if i*i=n then s:=s-i;
  wqs:=s;
  end;
begin
for i:=2 to 10000 do
    begin
    if wqs(i)=i then writeln(i);
    end;
end.