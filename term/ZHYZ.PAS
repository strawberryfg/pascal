var a,i,s:longint;
begin
read(a);
for i:=1 to trunc(sqrt(a)) do
if a mod i=0 then s:=s+i;
s:=s+a;
writeln(s);
if s=a+1 then writeln(a,' is a prime number') else writeln(a,' isn''t a prime number');
end.