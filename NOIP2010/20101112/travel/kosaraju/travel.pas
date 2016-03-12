const maxn=120;   maxm=1000000; maxk=10;
var n,m,k,x,y,len,cnt,p,i,j,ans:longint;
    belong,finish:array[1..maxn]of longint;
    vis:array[1..maxn]of boolean;
    edge,edge2,v:array[1..maxn,0..100*maxn]of longint;
    que,w:array[1..maxm]of longint;
    mark:array[1..maxn,0..maxk]of boolean;
    f:array[1..maxn,0..maxk]of longint;
procedure dfs(x:longint);
var i:longint;
begin
vis[x]:=true;
for i:=1 to edge[x,0] do
    begin
    if not vis[edge[x,i]] then dfs(edge[x,i]);
    end;
inc(p);
finish[p]:=x;
end;
procedure dfs2(x:longint);
var i:longint;
begin
belong[x]:=cnt;
for i:=1 to edge2[x,0] do
    begin
    if belong[edge2[x,i]]=0 then dfs2(edge2[x,i]);
    end;
end;
procedure spfa;
var i,j,head,tail,now,a,t,b:longint;
begin
fillchar(que,sizeof(que),0);
fillchar(mark,sizeof(mark),false);
for i:=1 to n do
    begin
    for j:=0 to k do
        f[i,j]:=maxlongint;
    end;
f[1,0]:=0; mark[1,0]:=true;
que[1]:=1; w[1]:=0;
head:=1; tail:=1;
while (head<=tail)do
 begin
 now:=que[head]; a:=w[head];
 mark[now,a]:=false;
 for i:=1 to edge[now,0] do
     begin
     t:=edge[now,i];
     b:=a;
     if belong[now]<>belong[t] then inc(b);
     if (f[now,a]+v[now,i]<f[t,b]) then
        begin
        f[t,b]:=f[now,a]+v[now,i];
        if not mark[t,b] then
           begin
           mark[t,b]:=true;
           inc(tail);
           que[tail]:=t; w[tail]:=b;
           end;
        end;
     end;

 inc(head);
 end;
end;
begin
assign(input,'travel.in');
reset(input);
assign(output,'travel.out');
rewrite(output);
readln(n,m,k);
for i:=1 to m do
    begin
    readln(x,y,len);
    inc(edge[x,0]); edge[x,edge[x,0]]:=y;
    v[x,edge[x,0]]:=len;
    inc(edge2[y,0]); edge2[y,edge2[y,0]]:=x;
    end;
for i:=1 to n do
    if not vis[i] then dfs(i);
for i:=p downto 1 do
    begin
    if belong[finish[i]]=0 then
       begin
       inc(cnt);
       dfs2(finish[i]);
       end;
    end;
for i:=1 to n do
    begin
    for j:=1 to edge[i,0] do
        begin
        if belong[i]<>belong[edge[i,j]] then v[i,j]:=2*v[i,j];
        end;
    end;
spfa;
ans:=maxlongint;
for i:=0 to k do
  if f[n,i]<ans then
      ans:=f[n,i];
if ans=maxlongint then writeln('Happy Birthday To WKN')
   else writeln(ans);
close(input);
close(output);
end.

