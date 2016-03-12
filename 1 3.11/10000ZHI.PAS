var i,j,n:longint;
begin
for j:=2 to 10000 do
if j=2 then write(' ',2)
       else
       begin
       n:=1;
       for i:=2 to trunc(sqrt(j)) do
        if j mod i=0 then begin n:=i; break; end;
        if n=1 then write(' ',j);
end;
end.