var a,b:longint;
function gys(a,b:longint):longint;
   begin
   if a mod b=0 then gys:=b
                else gys:=gys(b,a mod b);
   end;
begin
read(a,b);
writeln(gys(a,b):4);
end.