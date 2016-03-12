var n,sx,sy,i,nowv,num,fin:longint;
    x,y,r,frv,hash:array[1..10000]of longint;
    t,tot:extended;
    v:array[1..10000]of extended;
    pd:boolean;
function calc(a,b:longint):extended;
var t,p:longint;
    s:extended;
begin
t:=x[a]-x[b];
p:=y[a]-y[b];
s:=sqrt(t*t+p*p);
calc:=s;
end;
function fun(a,b:longint):extended;
var s:extended;
begin
s:=-1*v[b]*r[b]/r[a];
fun:=s;
end;
begin
assign(input,'baler.in');
reset(input);
assign(output,'baler.out');
rewrite(output);
readln(n,sx,sy);
for i:=1 to n do
     begin
     readln(x[i],y[i],r[i]);
     if (x[i]=0)and(y[i]=0) then
        begin
        nowv:=10000;
        num:=i;
        end;
     if (x[i]=sx)and(y[i]=sy) then
        begin
        fin:=i;
        end;
     end;
hash[num]:=1;
v[num]:=10000;
while num<>fin do
  begin
  pd:=true;
  while pd do
  begin
  for i:=1 to n do
      begin
      t:=r[i]+r[num];
      if (i<>num)and(hash[i]=0)and(t=calc(i,num)) then
         begin
         v[i]:=fun(i,num);
         frv[i]:=num;
         pd:=false;
         break;
         end;
      end;
  if pd=true then num:=frv[num];
  end;
  hash[i]:=1;
  num:=i;
  end;
tot:=tot+abs(v[fin]);
num:=frv[fin];
while num<>0 do
  begin
  tot:=tot+abs(v[num]);
  num:=frv[num];
  end;
writeln(trunc(tot));
close(input);
close(output);
end.