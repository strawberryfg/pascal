const maxn=100000;
type heapnode=record x,v:longint; end;
var n,i,tot,acc,ans:longint;
    can:array[1..maxn,1..2]of boolean;
    pos:array[1..2*maxn+1]of longint;
    f,p,d,sumf:array[0..2*maxn+1]of longint;
    heap:array[1..maxn+1]of heapnode;
procedure put(key,num:longint);
var t,tmp:longint;
    tt:heapnode;
begin
inc(tot); heap[tot].x:=num; pos[num]:=tot;  heap[tot].v:=key;
t:=tot;
while (t>1)and(heap[t].v<heap[t div 2].v) do
  begin
  tmp:=pos[heap[t].x]; pos[heap[t].x]:=pos[heap[t div 2].x]; pos[heap[t div 2].x]:=tmp;
  tt:=heap[t]; heap[t]:=heap[t div 2]; heap[t div 2]:=tt;
  t:=t div 2;
  end;
end;
procedure pop(num:longint);
var tmp,t,t1,t2,pnum:longint;
    tt:heapnode;
begin
if (num=0)or(num=2*n) then exit;
tmp:=pos[num];
pos[heap[tot].x]:=tmp; pos[num]:=0;
heap[tmp]:=heap[tot]; heap[tot].x:=0; heap[tot].v:=0;
dec(tot);
t:=tmp;
while (t*2<=tot) do
 begin
 t1:=heap[t*2].v; if t*2+1<=tot then t2:=heap[t*2+1].v else t2:=maxlongint;
 if t1<t2 then pnum:=0 else pnum:=1;
 if heap[t].v>heap[t*2+pnum].v then
    begin
    tmp:=pos[heap[t].x]; pos[heap[t].x]:=pos[heap[t*2+pnum].x]; pos[heap[t*2+pnum].x]:=tmp;
    tt:=heap[t]; heap[t]:=heap[t*2+pnum]; heap[t*2+pnum]:=tt;
    t:=t*2+pnum;
    end
 else
    break;
 end;
end;
begin
assign(input,'travel.in');
reset(input);
assign(output,'travel.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(p[i],d[i]);
    p[i+n]:=p[i]; d[i+n]:=d[i];
    end;
f[0]:=0; sumf[0]:=0;
for i:=1 to 2*n-1 do
    begin
    f[i]:=p[i]-d[i];
    sumf[i]:=sumf[i-1]+f[i];
    end;
tot:=0;
for i:=1 to n do put(sumf[i],i);
for i:=1 to n do
    begin
    pop(i-1);
    put(sumf[i+n-1],i+n-1);
    acc:=sumf[i-1];
    if heap[1].v-acc<0 then can[i,1]:=false else can[i,1]:=true;
    end;
ans:=d[1];
for i:=1 to n do
    begin
    if i<=n-1 then d[i]:=d[i+1]
       else d[i]:=ans;
    d[i+n]:=d[i];
    end;
sumf[2*n]:=0;
for i:=2*n-1 downto 1 do
    begin
    f[i]:=p[i+1]-d[i];
    sumf[i]:=sumf[i+1]+f[i];
    end;
tot:=0;
for i:=2*n-1 downto n do put(sumf[i],i);
for i:=2*n-1 downto n do
    begin
    pop(i+1);
    put(sumf[i-n+1],i-n+1);
    acc:=sumf[i+1];
    if heap[1].v-acc<0 then can[i-n+1,2]:=false else can[i-n+1,2]:=true;
    end;
for i:=1 to n do
    begin
    if (can[i,1]=true)or(can[i,2]=true) then writeln('TAK') else writeln('NIE');
    end;
close(input);
close(output);
end.