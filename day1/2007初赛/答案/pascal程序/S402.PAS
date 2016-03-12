program s402;
var a,b:integer;
    x,y:^integer;
procedure fun(a,b:integer);
var k:integer;
begin
 k:=a; a:=b; b:=k;
end;
begin
 a:=3; b:=6;
 x:=@a; y:=@b;
 fun(x^,y^);
 write('No.1:',a,',',b,'  ');
 fun(a,b);
 writeln('No.2:',a,',',b);
end.
