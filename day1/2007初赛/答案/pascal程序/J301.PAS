program j301;
var i,a,b,c,x,y:integer;
    p:array[0..4] of integer;
begin
   y:=20;
   for i:=0 to 4
     do read(p[i]);
   readln;
   a:=(p[0]+p[1])+(p[2]+p[3]+p[4]) div 7;
   b:=p[0]+p[1] div ((p[2]+p[3])div p[4]);
   c:=p[0]*p[1] div p[2];
   x:=a+b-p[(p[3]+3)mod 4];
   if(x>10)
     then y:=y+ (b*100-a) div(p[p[4] mod 3]*5)
   else
     y:=y+20+(b*100-c)div (p[p[4] mod 3]*5);
   writeln(x,',',y);
 end.

