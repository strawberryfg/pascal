var n,m,tot,total,sum,t1,t2,p,k,num,i:longint;
    a,heap,hash:array[1..10000000]of longint;
    lian:array[1..10000000,1..2]of longint;
    pd:boolean;
    ts:string;
    s:ansistring;
procedure heapify(now:longint);
var p,t:longint;
begin
p:=now;
while (p div 2>=1) do
  begin
  if heap[p]<heap[p div 2] then
     begin
     t:=heap[p]; heap[p]:=heap[p div 2];heap[p div 2]:=t;
     p:=p div 2;
     end
  else break;
  end;
end;
procedure extract;
var t,p,num:longint;
begin
t:=heap[1]; heap[1]:=heap[sum]; heap[sum]:=t;
dec(sum);
p:=1;
while (p*2<=sum) do
  begin
  t1:=heap[p*2]; if (p*2+1<=sum) then t2:=heap[p*2+1] else t2:=maxlongint;
  if t1<t2 then num:=0 else num:=1;
  t:=heap[p]; heap[p]:=heap[p*2+num];heap[p*2+num]:=t;
  p:=p*2+num;
  end;
end;
procedure check(t1:longint);
var mo,t,now:longint;
begin
mo:=t1 mod 999983;
if hash[mo]=0 then
   begin
   inc(total);
   hash[mo]:=total;
   lian[total,1]:=t1 div 999983;
   pd:=false;
   exit;
   end
else begin
     t:=hash[mo];
     if (lian[t,2]=0) then
        begin
        if lian[t,1]<>t1 div 999983 then pd:=false;
        exit;
        end;
     while (lian[t,2]<>0) do
       begin
       now:=lian[t,1];
       if now=t1 div 999983 then begin pd:=true;exit; end;
       t:=lian[t,2];
       end;
     inc(total);
     lian[t,2]:=total;
     lian[total,1]:=t1 div 999983;
     end;
end;
begin
assign(input,'number.in');
reset(input);
assign(output,'number.out');
rewrite(output);
readln(n,m);
heap[1]:=1;
tot:=0;
sum:=1;
hash[1]:=1;
total:=1;
a[1]:=0;
s:='';
while tot+1<=n do
  begin
  t1:=heap[1]*2+1; t2:=heap[1]*4+5;
  pd:=true;
  check(t1);
  if not pd then
     begin
     inc(sum);
     heap[sum]:=t1;
     heapify(sum);
     end;
  pd:=true;
  check(t2);
  if not pd then
     begin
     inc(sum);
     heap[sum]:=t2;
     heapify(sum);
     end;
  inc(tot);
  a[tot]:=heap[1];
  str(a[tot],ts);
  s:=s+ts;
  extract;
  write(a[tot]);
  end;
writeln;
{s:='';

for i:=1 to tot-1  do begin str(a[i],ts);s:=s+ts; end;}
num:=length(s);
p:=1;

while m>0 do
  begin
  if (num-(p-1))=m then begin p:=num+1;break; end;
  k:=p;
  for i:=p+1 to p+m do
      if s[i]>s[k] then k:=i;
  m:=m-(k-p);
  p:=k+1;
  write(s[k]);
  end;
for i:=p to num do write(s[i]);
writeln;
close(input);
close(output);
end.
