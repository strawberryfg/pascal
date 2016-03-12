var a,b,i,t,x,y:longint;
begin
writeln('please press two integers');
read(a,b);
x:=a;
y:=b;
if (a-b=1) or (a-b=-1) or (a=1) or (b=1) then
 begin
 writeln(a,' and ',b,'max=1');
 writeln(a,' and ',b,'min=',a*b);
 exit;
 end
else
while a mod b>0 do
 begin
 t:=a;
 a:=b;
 b:=t mod b;
 end;
writeln(x,' and ',y,'max=',b);
writeln(x,' and ',y,'min=',x*y/b:0:0);
end.