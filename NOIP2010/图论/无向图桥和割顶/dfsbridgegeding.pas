var i,n,m,x,y,top,tot,sum,time,root:longint;
    edge,f:array[1..100,0..100]of longint;
    colour,stack,low,rea,d,anc:array[1..100]of longint;
    cut:array[1..100]of boolean;
    bridge:array[1..100,0..100]of boolean;
function min(a,b:longint):longint;
begin
if a<b then exit(a) else exit(b);
end;
procedure dfs(now,father,dep:longint);
var i,t,total:longint;
begin
colour[now]:=1;   //now visiting;
inc(top); stack[top]:=now;
d[now]:=dep;
inc(time); low[now]:=time; rea[now]:=time; //exact
for i:=1 to edge[now,0] do
    begin
    t:=edge[now,i];
    if colour[t]=0 then dfs(t,now,dep+1);
    if colour[t]<2 then
       begin
       low[now]:=min(low[now],low[t]);
       end;
    end;
if rea[now]=low[now] then
   begin
   inc(tot);
   sum:=0;
   while stack[top+1]<>now do
       begin
       inc(sum);
       f[tot,sum]:=stack[top];
       colour[stack[top]]:=2;
       dec(top);
       end;
   end;
anc[now]:=dep;
total:=0;
for i:=1 to edge[now,0] do
    begin
    t:=edge[now,i];
    if (t<>father)and(colour[t]=1) then
       begin
       anc[now]:=min(anc[t],dep);
       end;
    if (colour[t]=0) then
       begin
       dfs(t,now,dep+1);
       end;
       inc(total);
        anc[now]:=min(anc[now],anc[t]);
        if ((now=root)and(total>1))or
        ((now<>root)and(anc[t]>=d[now])) then
          cut[now]:=true;
        if (anc[t]>d[now]) then
           bridge[now,t]:=true;
    end;
end;
begin
readln(n,m);
for i:=1 to m do
    begin
    readln(x,y);
    inc(edge[x,0]);
    edge[x,edge[x,0]]:=y;
    end;
top:=0;
root:=1;
for i:=1 to n do
    begin
    if colour[i]<>2 then
       begin
       dfs(i,0,0);
       end;
    end;
end.