var i,j,a,b:longint;
function zs(n:longint):boolean;
         var i:longint;
             a:boolean;
         begin
         a:=true;
         i:=1;
         for i:=2 to trunc(sqrt(n)) do
             if n mod i=0 then begin a:=false;break; end;
         zs:=a;
         end;
begin
readln(i);
for j:=2 to i div 2 do
    begin
    a:=j;
    b:=i-j;
    if (a<b)and (zs(a)=true) and (zs(b)=true) then writeln(a,'+',b,'=',i);
    end;
end.