var now,t,tot,n,m,s,v,x,y,w,cnt,i,j:longint;
    exist:array[1..100]of boolean;
    pos,key,heap:array[1..100]of longint;
    link,value:array[1..100,0..100]of longint;
procedure modify(id,newkey:longint);
var p,tmp:longint;
begin
if newkey<key[id] then
   begin
   key[id]:=newkey;
   p:=pos[id];
   while (p>1)and(key[heap[p]]<key[heap[p div 2]])do
     begin
     tmp:=pos[heap[p]];pos[heap[p]]:=pos[heap[p div 2]];pos[heap[p div 2]]:=tmp;
     tmp:=heap[p]; heap[p]:=heap[p div 2];heap[p div 2]:=tmp;
     p:=p div 2;
     end;
   end;
end;
procedure heapify(q:longint);
var t1,t2,ox,tmp,p:longint;
begin
t1:=maxlongint; t2:=maxlongint;
p:=q;
while (p*2<=tot) do
  begin
  t1:=key[heap[p*2]]; if (p*2+1<=tot) then t2:=key[heap[p*2+1]];
  if t1<t2 then ox:=0 else ox:=1;
  tmp:=heap[p];heap[p]:=heap[p*2+ox];heap[p*2+ox]:=tmp;
  tmp:=pos[heap[p]];pos[heap[p]]:=pos[heap[p*2+ox]];pos[heap[p*2+ox]]:=tmp;
  p:=p*2;
  end;
end;
procedure extract;
begin
now:=key[heap[1]];
t:=heap[1];
heap[1]:=heap[tot]; pos[heap[1]]:=pos[heap[tot]];
exist[t]:=false;
dec(tot);
if tot>0 then heapify(1);
end;
begin
assign(input,'dijkstra.in');
reset(input);
assign(output,'dijkstra.out');
rewrite(output);
readln(n,s,v);
readln(m);
for i:=1 to m do
  begin
  readln(x,y,w);
  cnt:=link[x,0]+1;
  link[x,cnt]:=y;
  inc(link[x,0]);
  value[x,y]:=w;
  end;
for i:=1 to n do
    begin
    key[i]:=maxlongint;
    pos[i]:=i;
    heap[i]:=i;
    exist[i]:=true;
    end;
tot:=n;
key[s]:=0;
while (tot>0) do
  begin
  extract;
  if now=maxlongint then break;
  for i:=1 to link[t,0] do
      begin
      if exist[link[t,i]]=true then modify(link[t,i],now+value[t,link[t,i]]);
      end;
  end;
writeln(key[v]);
close(input);
close(output);
end.