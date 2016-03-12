var i,j,n,sum,min,minnum,spe,ans:longint;
    pd:boolean;
    loop:array[1..100000]of longint;
    tot,hash:array[1..10]of longint;
    heap,number,pos:array[1..10,1..100000]of longint;
    produce:array[1..100000,1..10]of longint;
function gcd(ans,now:longint):longint;
var a,b,ta,tb,r:longint;
begin
a:=ans; b:=now;
if a<b then begin a:=a+b;b:=a-b;a:=a-b; end;
ta:=a; tb:=b;
r:=a mod b; a:=ans; b:=now;
while r<>0 do
 begin
 a:=b;
 b:=r;
 r:=a mod b;
 end;
if b=1 then exit(ans*now) else exit(trunc(ta*tb/b));
end;
procedure heapify(num,now:longint);
var t,k:longint;
begin
heap[num,tot[num]]:=produce[now,1];
number[num,tot[num]]:=now;
k:=tot[num];
pos[num,number[num,k]]:=k;
while (k div 2>=1)and(heap[num,k]<heap[num,k div 2])do
  begin
  t:=heap[num,k];
  heap[num,k]:=heap[num,k div 2];
  heap[num,k div 2]:=t;
  t:=number[num,k];
  number[num,k]:=number[num,k div 2];
  number[num,k div 2]:=t;
  pos[num,number[num,k]]:=k;
  pos[num,number[num,k div 2]]:=k div 2;
  k:=k div 2;
  end;
end;
procedure work(now,del,day:longint);
var k,t,i,p,tmp,t1,t2,x:longint;
begin
k:=pos[now,del];
if (k<>0)and(pd=false) then
begin
 t:=heap[now,k]; heap[now,k]:=heap[now,tot[now]]; heap[now,tot[now]]:=t;
 t:=number[now,k]; number[now,k]:=number[now,tot[now]]; number[now,tot[now]]:=t;
 pos[now,number[now,k]]:=k;
 dec(tot[now]);
 end;
k:=(day+1)mod now;  if k=0 then k:=now;
for i:=1 to tot[now] do
    begin
    tmp:=number[now,i];
    heap[now,i]:=produce[tmp,k];
    end;
for i:=tot[now] div 2 downto 1 do
    begin
    t1:=heap[now,i*2]; t2:=0;
    if (i*2+1<=tot[now]) then t2:=heap[now,i*2+1];
    x:=0; if (t2<>0)and(t2<t1) then x:=1;
    t:=heap[now,i]; heap[now,i]:=heap[now,i*2+x]; heap[now,i*2+x]:=t;
    t:=number[now,i]; number[now,i]:=number[now,i*2+x];number[now,i*2+x]:=t;
    pos[now,number[now,i]]:=i;
    pos[now,number[now,i*2+x]]:=i*2+x;
    {p:=i;
    while (p div 2>=1)and(heap[now,p]<heap[now,p div 2]) do
      begin
      t:=heap[now,p]; heap[now,p]:=heap[now,p div 2]; heap[now,p div 2]:=t;
      t:=number[now,p]; number[now,p]:=number[now,p div 2]; number[now,p div 2]:=t;
      pos[now,number[now,p]]:=p;
      pos[now,number[now,p div 2]]:=p div 2;
      end;}
    end;
end;
begin
assign(input,'poorcow.in');
reset(input);
assign(output,'poorcow.out');
rewrite(output);
readln(n);
ans:=1;
for i:=1 to n do
  begin
  read(loop[i]);
  for j:=1 to loop[i] do read(produce[i,j]);
  inc(tot[loop[i]]);
  heapify(loop[i],i);
  if hash[loop[i]]=0 then
     begin
     hash[loop[i]]:=1;
     if ans=1 then ans:=loop[i] else ans:=gcd(ans,loop[i]);
     end;
  end;
sum:=n;
for i:=1 to ans*2+1 do
   begin
   min:=maxlongint;minnum:=0;pd:=false;
   for j:=1 to 10 do
       begin
       if hash[j]=0 then continue;
       if tot[j]=0 then continue;
       if heap[j,1]=min then begin pd:=true;break; end;
       if heap[j,1]<min then begin min:=heap[j,1];minnum:=j; end;
       end;
   if tot[minnum]>=2 then
      begin
      if heap[minnum,2]=heap[minnum,1] then pd:=true;
      if tot[minnum]>=3 then
         if heap[minnum,3]=heap[minnum,1] then pd:=true;
      end;
   //if pd=true then continue;
   if not pd then dec(sum);
   spe:=number[minnum,1];
   for j:=1 to 10 do
      if hash[j]=1 then work(j,spe,i);
   if sum=0 then break;
   end;
writeln(sum);
close(input);
close(output);
end.