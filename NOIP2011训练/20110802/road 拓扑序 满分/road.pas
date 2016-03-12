const maxn=10020; maxm=100020;
type re=record u,v,w,nxt:longint; end;
     rec=record cnt,fir,last:longint; end;
var s,e,n,m,t0,x,y,t,tot,i,ans,tmp,res,p,q,up,down:longint;
    g,h:array[1..maxm]of re;
    edge,done:array[1..maxn]of rec;
    a,b,fin,fout:array[1..maxn]of longint;
    hash,vis:array[1..maxn]of boolean;
procedure addedge(x,y,z,ind:longint);
begin
if ind=1 then
   begin
   inc(tot); g[tot].u:=x; g[tot].v:=y; g[tot].w:=z;
   inc(edge[x].cnt);
   if edge[x].fir=0 then
      begin
      edge[x].fir:=tot;
      edge[x].last:=tot;
      end
   else
      begin
      g[edge[x].last].nxt:=tot;
      edge[x].last:=tot;
      end;
   end
else
   begin
    h[tot].u:=x; h[tot].v:=y; h[tot].w:=z;
    inc(done[x].cnt);
   if done[x].fir=0 then
      begin
      done[x].fir:=tot;
      done[x].last:=tot;
      end
   else
      begin
      h[done[x].last].nxt:=tot;
      done[x].last:=tot;
      end;
   end;
end;
procedure dfs1(x:longint);
var t,tmp:longint;
begin
vis[x]:=true;
t:=edge[x].fir;
while t<>0 do
  begin
  tmp:=g[t].v;
  if not vis[tmp] then dfs1(tmp);
  t:=g[t].nxt;
  end;
inc(p);
a[p]:=x;
end;
procedure dfs2(x:longint);
var t,tmp:longint;
begin
hash[x]:=true;
t:=done[x].fir;
while t<>0 do
  begin
  tmp:=h[t].v;
  if not hash[tmp] then dfs2(tmp);
  t:=h[t].nxt;
  end;
inc(q);
b[q]:=x;
end;
begin
assign(input,'road.in');
reset(input);
assign(output,'road.out');
rewrite(output);
readln(n,m,s,e,t0);
tot:=0;
for i:=1 to m do
    begin
    readln(x,y,t);
    addedge(x,y,t,1);
    addedge(y,x,t,2);
    end;
p:=0; q:=0;
dfs1(s);
dfs2(e);
for i:=1 to p do
    if a[i]=s then up:=i else if a[i]=e then down:=i;
fin[s]:=1;
for i:=up downto down  do
    begin
    t:=edge[a[i]].fir;
    while t<>0 do
      begin
      tmp:=g[t].v;
      fin[tmp]:=(fin[tmp]+fin[a[i]])mod 10000;
      t:=g[t].nxt;
      end;
    end;
for i:=1 to q do
    if b[i]=e then up:=i else if b[i]=s then down:=i;
fout[e]:=1;
for i:=up downto down  do
    begin
    t:=done[b[i]].fir;
    while t<>0 do
      begin
      tmp:=h[t].v;
      fout[tmp]:=(fout[tmp]+fout[b[i]])mod 10000;
      t:=h[t].nxt;
      end;
    end;
for i:=1 to m do
    begin
    res:=(fin[g[i].u]*fout[g[i].v])mod 10000;
    res:=res*g[i].w mod 10000;
    ans:=(ans+res)mod 10000;
    end;
res:=fin[e];
res:=(res-1)mod 10000;
res:=res*t0 mod 10000;
ans:=(ans+res)mod 10000;
writeln(ans);
close(input);
close(output);
end.
