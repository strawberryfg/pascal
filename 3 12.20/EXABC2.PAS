var a,b,c:longint;
begin
read(a,b,c);
if (a<b) and (b<c) then writeln(a,' ',b,' ',c);
if (a<c) and (c<b) then writeln(a,' ',c,' ',b);
if (b<c) and (c<a) then writeln(b,' ',c,' ',a);
if (b<a) and (a<c) then writeln(b,' ',a,' ',c);
if (c<a) and (a<b) then writeln(c,' ',a,' ',b);
if (c<b) and (b<a) then writeln(c,' ',b,' ',a);
end.