var n,i,k,tot,sum,num,tt,total,t:longint;
    a,ta:array[1..1000000]of longint;
    hash:array[1..1000000]of longint;
    lian:array[1..10000000,1..2]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]<x do
            inc(i);
           while x<a[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
procedure heap(p:longint);
var t,tmp:longint;
begin
t:=p;
while (t>1)and(a[t div 2]>a[t]) do
  begin
  //tmp:=pos[a[t div 2]]; pos[a[t div 2]]:=pos[a[t]]; pos[a[t]]:=tmp;
  tmp:=a[t div 2]; a[t div 2]:=a[t]; a[t]:=tmp;
  t:=t div 2;
  end;
end;
procedure change(tt:longint);
var p,t1,t2,min,tmp,minnum:longint;
begin
//tmp:=pos[num]; pos[num]:=pos[a[tot]]; pos[a[tot]]:=tmp;
tmp:=a[tt]; a[tt]:=a[tot]; a[tot]:=tmp;
p:=tt;
dec(tot);
while (p*2<=tot) do
  begin
  t1:=a[p*2]; t2:=maxlongint;
  if p*2+1<=tot then t2:=a[p*2+1];
  if t1<t2 then begin min:=t1;minnum:=0; end else begin min:=t2;minnum:=1;end;
  //tmp:=pos[a[p]]; pos[a[p]]:=pos[a[p*2+minnum]]; pos[a[p*2+minnum]]:=tmp;
  if a[p]<=min then break;
  tmp:=a[p]; a[p]:=a[p*2+minnum]; a[p*2+minnum]:=tmp;
  p:=p*2+minnum;
  end;
end;
function search(nn:longint):longint;
var left,right,mid,i:longint;
begin
for i:=1 to tot do if a[i]=nn then exit(i);
end;
procedure find(mo:longint);
var now,tnow:longint;
begin
if hash[mo]=0 then
   begin
   inc(total);
   lian[total,1]:=(num*ta[i]) div 999983;
   hash[mo]:=total;
   inc(tot);
   a[tot]:=num*ta[i];
   heap(tot);
   end
else
   begin
   now:=hash[mo];
   if int64(lian[now,1]*999983+mo)=int64(num*ta[i]) then  exit;
   tnow:=now;
   while (lian[now,2]<>0) do
     begin
     tnow:=now;
     now:=lian[now,2];
     if int64(lian[now,1]*999983+mo)=int64(num*ta[i]) then exit;
     end;
   inc(total);
   lian[now,2]:=total;
   lian[total,1]:=(num*ta[i]) div 999983;
   inc(tot);
   a[tot]:=num*ta[i];
   heap(tot);
   end;
end;
begin
assign(input,'panda.in');
reset(input);
assign(output,'panda.out');
rewrite(output);
readln(n,k);
for i:=1 to n do
    begin
    read(a[i]);
    end;
sort(1,n);
ta:=a;
for i:=1 to n do
    begin
    inc(total);
    lian[total,1]:=a[i];
    hash[a[i]]:=total;
    end;
//for i:=1 to n do pos[a[i]]:=i;
tot:=n;
sum:=0;
total:=0;
while tot>0 do
  begin
  num:=a[1];
  for i:=1 to n do
      begin
      if int64(num)*int64(ta[i])>int64(maxlongint) then
      continue;
      t:=num*ta[i] mod 999983;
      find(t);
      end;
  inc(sum);
  if sum=k then
     begin
     writeln(num);
     break;
     end;
  tt:=search(num);
  change(tt);
  end;
close(input);
close(output);
end.
