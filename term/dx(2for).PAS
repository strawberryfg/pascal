var t,num,i,output,n,dx:longint;
begin
writeln('please press a integer');
read(num);
t:=num;
for  i:=1 to 10 do
 begin
  num:=num div 10;
  if num>0 then n:=n+1;
 end;
 n:=n+1;
for dx:=1 to n do
begin
output:=output*10+t mod 10;
t:=t div 10;
end;
writeln(output);
end.