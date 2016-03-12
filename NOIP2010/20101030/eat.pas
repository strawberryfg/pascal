var n,m1,m2,a,b,c,td,i,j,k,t1,t2,tot,now:longint;
    fun,pow,f,p,link:array[1..1000,0..10000]of longint;
    exist:array[1..10000]of boolean;
    pos,heap,d,e:array[1..10000]of longint;
procedure heapify(p:longint);
var t1,t2,t,num:longint;
begin
while (p*2<=tot)and(d[heap[p*2]]<d[heap[p]]) do
  begin
  t1:=d[heap[p*2]];
  if (p*2+1<=tot) then t2:=d[heap[p*2+1]] else t2:=maxlongint;
  if t1<t2 then num:=0 else num:=1;
   t:=pos[heap[p]]; pos[heap[p]]:=pos[heap[p*2+num]]; pos[heap[p*2+num]]:=t;
   t:=heap[p]; heap[p]:=heap[p*2+num]; heap[p*2+num]:=t;
  end;
end;
procedure extract;
var id,dis,t:longint;
begin
id:=heap[1];
dis:=d[id];
i:=id; now:=dis;
dec(tot);
if tot>0 then
   begin
   t:=pos[heap[1]]; pos[heap[1]]:=pos[heap[tot+1]]; pos[heap[tot+1]]:=t;
   t:=heap[1]; heap[1]:=heap[tot+1]; heap[tot+1]:=t;
   heapify(1);
   end;
end;
procedure modify(num,x:longint);
var p,t:longint;
begin
if x<d[num] then
   begin
   p:=pos[num];
    d[num]:=x;
   e[num]:=e[i]+fun[i,num];
   while p div 2>=1 do
      begin
      if d[heap[p]]<d[heap[p div 2]] then
         begin
         t:=pos[heap[p]]; pos[heap[p]]:=pos[heap[p div 2]]; pos[heap[p div 2]]:=t;
         t:=heap[p]; heap[p]:=heap[p div 2]; heap[p div 2]:=t;
         end
      else break;
      p:=p div 2;
      end;

   end;
end;
begin
assign(input,'eat.in');
reset(input);
assign(output,'eat.out');
rewrite(output);
readln(n,m1,m2);
for i:=1 to n do for j:=1 to n do begin fun[i,j]:=maxlongint; pow[i,j]:=maxlongint; end;
for i:=1 to m2 do
    begin
    readln(a,b,c);
    inc(link[a,0]);
    link[a,link[a,0]]:=b;
    f[a,link[a,0]]:=c;
    fun[a,b]:=c;
    pow[a,b]:=0;
    end;
for i:=1 to m1 do
    begin
    readln(a,b,c,td);
    inc(link[a,0]);
    link[a,link[a,0]]:=b;
    f[a,link[a,0]]:=c;
    p[a,link[a,0]]:=td;
    fun[a,b]:=c;
    pow[a,b]:=td;
    end;
for i:=1 to n do
    begin
    pos[i]:=i;
    heap[i]:=i;
    exist[i]:=true;
    d[i]:=maxlongint;
    end;
d[1]:=0;
tot:=n;
while (tot>0) do
  begin
  extract;
  if now=maxlongint then break;
  for j:=1 to link[i,0] do
      begin
      if exist[link[i,j]]=false then  continue;
      modify(link[i,j],now+pow[i,link[i,j]]);
      end;
  exist[i]:=false;
  end;
writeln(d[n], ' ',e[n]);
close(input);
close(output);
end.
