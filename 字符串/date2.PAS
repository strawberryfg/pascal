const a:array[1..11]of longint=(31,28,31,30,31,30,31,31,30,31,30);
      s:array[0..6]of longint=(7,1,2,3,4,5,6);
var y,m,d,i,t,k,l:longint;
begin
read(y,m,d);
t:=365*(y-1900);
t:=t+(y-1)div 4;
k:=(y-1)div 400;
l:=(y-1)div 100;
t:=t-(l-k);
for i:=1 to m-1 do
    t:=t+a[i];
if (y mod 400=0)or((y mod 100<>0)and(y mod 4=0)) and(m>2) then t:=t+1;
t:=t+d;
t:=t mod 7;
writeln('    ',s[t]);
end.