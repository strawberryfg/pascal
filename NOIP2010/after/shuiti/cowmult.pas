var a,b,tot,m,n,sum,i,j:longint;
    x,y:array[1..100]of longint;
begin

readln(a,b);
while a<>0 do
  begin
  inc(tot);
  x[tot]:=a mod 10;
  a:=a div 10;
  end;
m:=tot;
tot:=0;
while b<>0 do
   begin
   inc(tot);
   y[tot]:=b mod 10;
   b:=b div 10;
   end;
n:=tot;
sum:=0;
for i:=1 to m do
    begin
    for j:=1 to n do
        begin
        sum:=sum+x[i]*y[j];
        end;
    end;
writeln(sum);

end.