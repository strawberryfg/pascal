const maxn=100020; maxm=500020;
type rec=record u,v,nxt:longint; end;
     re=record fir,last:longint; end;
var n,m,i,x,y,z,p,q,num,totg,tottg,toth,totth,total,sum,fmax,tmp,t:longint;
    vis,hash:array[1..maxn]of boolean;
    edge,opp,edge2,opp2:array[1..maxn]of re;
    g,h,tg,th:array[1..maxm]of rec;
    v,col,a,b,low,high,flow,fhigh,tlow,thigh:array[1..maxn]of longint;
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
inc(tottg); tg[tottg].u:=y; tg[tottg].v:=x;
if opp[y].fir=0 then
   begin
   opp[y].fir:=tottg;
   opp[y].last:=tottg;
   end
else
   begin
   tg[opp[y].last].nxt:=tottg;
   opp[y].last:=tottg;
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
col[x]:=num;
if v[x]<low[num] then low[num]:=v[x];
if v[x]>high[num] then high[num]:=v[x];
t:=opp[x].fir;
while t<>0 do
  begin
  tmp:=tg[t].v;
  if col[tmp]=0 then dfs2(tmp);
  t:=tg[t].nxt;
  end;
end;
procedure buildgraph(x,y:longint);
begin
inc(toth); h[toth].u:=x; h[toth].v:=y;
inc(totth); th[totth].u:=y; th[totth].v:=x;
if edge2[x].fir=0 then
   begin
   edge2[x].fir:=toth;
   edge2[x].last:=toth;
   end
else
   begin
   h[edge2[x].last].nxt:=toth;
   edge2[x].last:=toth;
   end;
if opp2[y].fir=0 then
   begin
   opp2[y].fir:=totth;
   opp2[y].last:=totth;
   end
else
   begin
   th[opp2[y].last].nxt:=totth;
   opp2[y].last:=totth;
   end;
end;
procedure topsort(x:longint);
var t,tmp:longint;
begin
hash[x]:=true;
t:=edge2[x].fir;
while t<>0 do
  begin
  tmp:=h[t].v;
  if not hash[tmp] then topsort(tmp);
  t:=h[t].nxt;
  end;
inc(q);
b[q]:=x;
end;
begin
assign(input,'trade.in');
reset(input);
assign(output,'trade.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    begin
    read(v[i]);
    high[i]:=-maxlongint; low[i]:=maxlongint;
    end;
for i:=1 to m do
    begin
    readln(x,y,z);
    addedge(x,y);
    if z=2 then addedge(y,x);
    end;
for i:=1 to n do
    if not vis[i] then dfs1(i);
for i:=p downto 1 do
    begin
    if col[a[i]]=0 then
       begin
       inc(num);
       dfs2(a[i]);
       end;
    end;
for i:=1 to totg do
    begin
    if col[g[i].u]<>col[g[i].v] then
       begin
       buildgraph(col[g[i].u],col[g[i].v]);
       end;
    end;
for i:=1 to num do
    if not hash[i] then topsort(i);
flow[col[1]]:=low[col[1]]; fhigh[col[1]]:=high[col[1]];
tlow[col[n]]:=low[col[n]]; thigh[col[n]]:=high[col[n]];
for i:=q downto 1 do
    begin
    if flow[b[i]]<>0 then
       begin
       t:=edge2[b[i]].fir;
       while t<>0 do
         begin
         tmp:=h[t].v;
         if (flow[tmp]=0) then
            begin
            flow[tmp]:=low[tmp]; fhigh[tmp]:=high[tmp];
            end;
         if flow[b[i]]<flow[tmp] then flow[tmp]:=flow[b[i]];
         if fhigh[b[i]]>fhigh[tmp] then fhigh[tmp]:=fhigh[b[i]];
         t:=h[t].nxt;
         end;
       end;
    end;
for i:=1 to q do
    begin
    if tlow[b[i]]<>0 then
       begin
       t:=opp2[b[i]].fir;
       while t<>0 do
         begin
         tmp:=th[t].v;
         if (tlow[tmp]=0) then
            begin
            tlow[tmp]:=low[tmp]; thigh[tmp]:=high[tmp];
            end;
         if tlow[b[i]]<tlow[tmp] then tlow[tmp]:=tlow[b[i]];
         if thigh[b[i]]>thigh[tmp] then thigh[tmp]:=thigh[b[i]];
         t:=th[t].nxt;
         end;
       end;
    end;
fmax:=0;
for i:=1 to num do
    begin
    if thigh[i]-flow[i]>fmax then fmax:=thigh[i]-flow[i];
    end;
writeln(fmax);
close(input);
close(output);
end.