var p,q,x,y,res:longint;
procedure eulid(a,b:longint);
var tmp:longint;
begin
if b=0 then
   begin
   x:=1; y:=0; res:=a;
   end
else
   begin
   eulid(b,a mod b);
   tmp:=x;
   x:=y;
   y:=tmp-a div b*y;
   end;
end;
begin
readln(p,q);
if p<q then begin p:=p+q; q:=p-q; p:=p-q; end;
eulid(p,q);
writeln(res,'=',x,'*',p,'+',y,'*',q);
end.