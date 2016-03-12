program s401;
var p,q:array[0..5] of integer;
    i,x,y:integer;
begin
   y:=20;
   for i:=0 to 4 do
     read(p[i]);
   readln;
   q[0]:=(p[0]+p[1])+(p[2]+p[3]+p[4]) div 7;
   q[1]:=p[0]+p[1] div ((p[2]+p[3]) div p[4]);
   q[2]:=p[0]*p[1] div p[2];
   q[3]:=q[0]*q[1];
   q[4]:=q[1]+q[2]+q[3];
   x:=(q[0]+q[4]+2)-p[(q[3]+3) mod 4];
   if (x>10) then
     y:=y+(q[1]*100-q[3]) div (p[p[4] mod 3]*5)
   else
     y:=y+20+(q[2]*100-q[3]) div (p[p[4] mod 3]*5);
   writeln(x,',',y);
end.

