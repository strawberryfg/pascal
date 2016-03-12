var a,b,p,q,n,i,s:longint;
begin
read(s);
for n:=2 to s div 2 do
begin
    p:=1;
    a:=n;
    b:=s-a;
    for i:=2 to trunc(sqrt(a)) do
        if a mod i=0 then begin p:=0;break;end;
    if p=1 then
    begin
    q:=1;
    for i:=2 to trunc(sqrt(b)) do
        if b mod i=0 then begin q:=0;break;end;
    end;
    if (p=1)and(q=1)and(a<>b) then writeln(s,'=',a,'+',b);
end;
end.