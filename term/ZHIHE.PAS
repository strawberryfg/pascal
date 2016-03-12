var a,i,n:longint;
begin
read(a);
if a=2 then begin writeln(a,' is a zhishu');exit; end;
if (a=0) or (a=1) then
begin
writeln(a,' is not a zhishu or a heshu');
exit;
end
else
begin
n:=1;
for i:=2 to trunc(sqrt(a)) do
 if a mod i=0 then n:=i;
end;
if n=1 then writeln(a,' is a zhishu')
       else writeln(a,' is a heshu');
end.