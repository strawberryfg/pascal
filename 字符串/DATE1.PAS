const a:array[1..11]of longint=(31,28,31,30,31,30,31,31,30,31,30);
      s:array[0..6]of longint=(7,1,2,3,4,5,6);
var y,m,d,i,t:longint;
begin
read(y,m,d);
for i:=1 to y-1 do
    if (i mod 4=0)and(i mod 100<>0)or(i mod 400=0) then t:=t+366
                                                   else t:=t+365;
for i:=1 to m-1 do
    t:=t+a[i];
if (m>2) and((y mod 4=0)and(y mod 100<>0)or(y mod 400=0)) then t:=t+1;
t:=t+d;
t:=t mod 7;
writeln(s[t]);
end.