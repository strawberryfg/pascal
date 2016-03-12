const maxn=2020;
var sum,top,tme,tot,i,j,n:longint;
    stack,rea,low,hash,que,belong:array[0..maxn]of longint;
    vis,instack:array[0..maxn]of boolean;
    v,g,edge:array[0..maxn,0..maxn]of longint;
    t:char;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
procedure tarjan(u:longint);
var i:longint;
begin
vis[u]:=true;
instack[u]:=true;
inc(top);
stack[top]:=u;
inc(tme);
low[u]:=tme; rea[u]:=tme;
for i:=1 to n do
    begin
    if g[u,i]=1 then
       begin
       if not vis[i] then
          begin
          tarjan(i);
          low[u]:=min(low[u],low[i]);
          end
       else if instack[i] then          // haizai zhanzhong
               begin
               low[u]:=min(low[u],rea[i]);
               end;
       end;
    end;
if rea[u]=low[u] then
   begin
   inc(tot);
   while stack[top+1]<>u do
     begin
     belong[stack[top]]:=tot;
     instack[stack[top]]:=false;
     dec(top);
     end;
   end;
end;
procedure bfs(x:longint);
var tail,head,t,p,i:longint;
begin
fillchar(vis,sizeof(vis),0);
tail:=1; head:=1; que[1]:=x;
vis[x]:=true;
while tail<=head do
  begin
  t:=que[tail];
  sum:=sum+hash[t]*hash[x];
  for i:=1 to edge[t,0] do
      begin
      p:=edge[t,i];
      if not vis[p] then
         begin
         vis[p]:=true;
         inc(head);
         que[head]:=p;
         end;
      end;
  inc(tail);
  end;
end;
begin
assign(input,'connect.in');
reset(input);
assign(output,'connect.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        read(t);
        if t='1' then g[i,j]:=1 else g[i,j]:=0;
        end;
    readln;
    end;
for i:=1 to n do
    begin
    if not vis[i] then tarjan(i);
    end;
for i:=1 to n do
    begin
    inc(hash[belong[i]]);
    end;
for i:=1 to n do
    for j:=1 to n do
        begin
        if g[i,j]=1 then v[belong[i],belong[j]]:=1;
        end;
for i:=1 to tot do
    begin
    for j:=1 to tot do
        begin
        if v[i,j]=1 then
           begin
           inc(edge[i,0]);
           edge[i,edge[i,0]]:=j;
           end;
        end;
    end;
for i:=1 to tot do
    begin
    bfs(i);
    end;
writeln(sum);
close(input);
close(output);
end.
