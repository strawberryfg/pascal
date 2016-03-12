var q,b,i,s,k:longint;
begin
for q:=1 to 10000 do
    begin
    s:=0;
    for i:=1 to q div 2 do
        if q mod i=0 then s:=s+i;
    k:=0;
    for i:=1 to s div 2 do
        if s mod i=0 then k:=k+i;
    if (k=q)and(q<>s) then begin writeln(q:6,s:6);q:=s; end;
    end;
end.
