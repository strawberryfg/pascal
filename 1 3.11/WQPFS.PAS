var i,j,chg:longint;
    t:real;
begin
for i:=1 to 10000 do
begin
 t:=sqrt(i);
 chg:=trunc(t);
 if t-chg=0 then write(' ',i);
end;
end.