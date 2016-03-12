const maxn=100020; maxm=500020; maxx=3000200;
type re=record u,v,nxt:longint; end;
     rec=record fir,last:longint; end;
var g,h:array[1..maxm]of re;
    edge,edge2:array[1..maxn]of rec;
    q:array[1..maxx]of longint;
    totg,toth,i,n,m,x,y,z,fmax:longint;
    high,low,v:array[1..maxn]of longint;
    mark:array[1..maxn]of boolean;
    flag:boolean;
procedure addedge(x,y:longint);
begin
inc(totg); g[totg].u:=x; g[totg].v:=y;
if edge[x].fir=0 then
   begin
   edge[x].fir:=totg;
   edge[x].last:=totg;
   end
else
   begin
   g[edge[x].last].nxt:=totg;
   edge[x].last:=totg;
   end;
inc(toth); h[toth].u:=y; h[toth].v:=x;
if edge2[y].fir=0 then
   begin
   edge2[y].fir:=toth;
   edge2[y].last:=toth;
   end
else
   begin
   h[edge2[y].last].nxt:=toth;
   edge2[y].last:=toth;
   end;
end;
procedure spfa;
var head,tail,now,tmp,t:longint;
begin
head:=1; tail:=1; q[1]:=1; low[1]:=v[1];
mark[1]:=true;
while head<=tail do
 begin
 now:=q[head];
 t:=edge[now].fir;
 while t<>0 do
   begin
   tmp:=g[t].v;
   flag:=false;
   if low[tmp]=0 then begin low[tmp]:=v[tmp];flag:=true; end;
   if low[now]<low[tmp] then
      begin
      flag:=true;
      low[tmp]:=low[now];
      end;
   if (flag)and(not mark[tmp]) then
      begin
      inc(tail);
      q[tail]:=tmp;
      mark[tmp]:=true;
      end;
   t:=g[t].nxt;
   end;
 mark[now]:=false;
 inc(head);
 end;
end;
procedure spfa2;
var head,tail,now,t,tmp:longint;
begin
head:=1; tail:=1; q[1]:=n; high[n]:=v[n];
fillchar(mark,sizeof(mark),false);
mark[n]:=true;
while head<=tail do
 begin
 now:=q[head];
 t:=edge2[now].fir;
 while t<>0 do
   begin
   tmp:=h[t].v;
   flag:=false;
   if high[tmp]=0 then begin high[tmp]:=v[tmp];flag:=true; end;
   if high[now]>high[tmp] then
      begin
      high[tmp]:=high[now];
      flag:=true;
      end;
   if (flag)and(not mark[tmp]) then
      begin
      inc(tail);
      q[tail]:=tmp;
      mark[tmp]:=true;
      end;
   t:=h[t].nxt;
   end;
 mark[now]:=false;
 inc(head);
 end;
end;
begin
assign(input,'trade.in');
reset(input);
assign(output,'trade.out');
rewrite(output);
readln(n,m);
for i:=1 to n do read(v[i]);
for i:=1 to m do
    begin
    readln(x,y,z);
    addedge(x,y);
    if z=2 then addedge(y,x);
    end;
spfa;
spfa2;
fmax:=0;
for i:=1 to n do
    begin
    if (high[i]<>0)and(low[i]<>0)and(high[i]-low[i]>fmax) then
        fmax:=high[i]-low[i];
    end;
writeln(fmax);
close(input);
close(output);
end.