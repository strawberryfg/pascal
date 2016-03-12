program j302;
var a,b:integer;
var x,y:^integer;
procedure fun(a,b:integer);
 var k:integer;
begin
 k:=a;a:=b;b:=k;
end;
begin
 a:=3;b:=6;
 x:=@a;y:=@b;
 fun(x^,y^);
 writeln(a,',',b);
end.

