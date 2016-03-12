var a,b,c,now,num,t,total,last,t1,t2,t4:longint;
    t3:int64;
    pd:boolean;
    hash:array[0..100000]of longint;
    lian:array[0..1000000,1..2]of longint;
procedure check(x:longint);
var now:longint;
begin
if hash[x mod 99991]=0 then
   begin
   inc(total);
   lian[total,1]:=x div 99991;
   hash[x mod 99991]:=total;
   end
else
   begin
   now:=hash[x mod 99991];
   if lian[now,1]=x div 99991 then begin pd:=false;exit; end;
   while lian[now,2]<>0 do
      begin
      now:=lian[now,2];
      if lian[now,1]=x div 99991 then exit;
      end;
   inc(total);
   lian[now,2]:=total;
   lian[total,1]:=x div 99991;
   end;
end;
begin
assign(input,'seq.in');
reset(input);
assign(output,'seq.out');
rewrite(output);
readln(a,b,c);
total:=1;
hash[1]:=1;
lian[1,1]:=0;
pd:=true;
now:=0;
last:=1;
while pd do
  begin
  t1:=a mod c;
  t2:=last mod c;
  t3:=(int64(t1)*int64(t2)) mod c;
  t4:=(last mod b) mod c;
  t:=(t3+t4) mod c;
  check(t);
  last:=t;
  if pd=false then begin num:=now+1; break; end;
  inc(now);
  end;
if num>2000000 then writeln(-1)
   else writeln(num);
close(input);
close(output);
end.
