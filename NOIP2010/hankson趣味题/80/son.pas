{21:15 22:15}
var n,a,b,c,d,zong,tot,i,j,k,tt,max,sum:longint;
    zhi,prime,fhash:array[1..10000]of longint;
    hash:array[1..50000]of byte;
    res,f,final:array[1..4,0..10000]of longint;
    mark:boolean;
procedure pre;
var i,j,t:longint;
begin
i:=2; t:=trunc(sqrt(maxlongint));
while (i+i<=t) do
  begin
  if hash[i]=1 then begin inc(i);continue; end;
  j:=i+i;
  while j<=t do
    begin
    hash[j]:=1;
    j:=j+i;
    end;
  inc(i);
  end;
for i:=2 to t do if hash[i]=0 then begin inc(zong);prime[zong]:=i; end;
end;
procedure handle(num,doit:longint);
var t,now,sum,p:longint;
    pd:boolean;
    f,shu:array[0..10000]of longint;
begin
t:=num;
now:=1;
sum:=0;
fillchar(f,sizeof(f),0);
//fillchar(shu,sizeof(shu),0);
while (t<>1)and(now<=zong) do
  begin
  p:=prime[now];
  while t mod p=0 do
    begin
    if fhash[now]=0 then
      begin
      fhash[now]:=1;
      inc(tot);
      zhi[tot]:=now;
      end;
    inc(sum); //shu[sum]:=p;
    inc(f[now]);
    t:=t div p;
    end;
  inc(now);
  end;
if t<>1 then
   begin
   //   inc(sum); shu[sum]:=t;
   inc(f[zong+1]);
   f[0]:=t;
   pd:=true;
   for i:=1 to tot do if zhi[i]=t then begin pd:=false;break; end;
   if pd then
      begin
      inc(tot);
      zhi[tot]:=t;
      end;
   end;
res[doit]:=f;
end;
procedure work;
var down2,down1,up1,up2,i,left,right:longint;
begin
sum:=1;
for i:=1 to tot do
    begin
    if final[1,i]<final[2,i] then
       begin mark:=false; exit; end;
    if final[3,i]>final[4,i] then
       begin mark:=false; exit; end;
    if final[1,i]>final[2,i] then
       begin
       down1:=final[2,i]; up1:=final[2,i];
       end;
    if final[3,i]<final[4,i] then
       begin
       down2:=final[4,i]; up2:=final[4,i];
       end;
    if final[1,i]=final[2,i] then
       begin
       down1:=final[1,i]; up1:=maxlongint;
       end;
    if final[3,i]=final[4,i] then
       begin
       down2:=0; up2:=final[3,i];
       end;
    if (down2>up1)or(up2<down1) then
       begin mark:=false;exit; end;
    left:=down1; if down2>left then left:=down2;
    right:=up1; if up2<right then right:=up2;
    if right<left then
      begin mark:=false; exit; end;
    sum:=sum*(right-left+1);
    end;
end;
begin
assign(input,'son.in');
reset(input);
assign(output,'son.out');
rewrite(output);
readln(n);
pre;
max:=trunc(sqrt(maxlongint));
for i:=1 to n do
    begin
    readln(a,b,c,d);
    fillchar(res,sizeof(res),0);
    fillchar(fhash,sizeof(fhash),0);
    tot:=0;
    fillchar(zhi,sizeof(zhi),0);
    fillchar(final,sizeof(final),0);

    handle(a,1);
    handle(b,2);
    handle(c,3);
    handle(d,4);
    for j:=1 to tot do
        begin
        for k:=1 to 4 do
           begin
           if zhi[j]>max then
              inc(final[k,j],res[k,zong+1])
           else
              begin
              tt:=zhi[j];
              inc(final[k,j],res[k,tt]);
              end;
           end;
        end;
    mark:=true;
    work;
    if not mark then writeln(0)
      else writeln(sum);
    end;

close(input);
close(output);
end.
