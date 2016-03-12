//14:23; 14:41;
const maxn=5020; maxx=1000020;
type rec=record u,v,w:longint; end;
var n,i,x,y,w,t,ans,len:longint;
    edge,f:array[0..maxn,0..maxn]of longint;
    hash,dis,from:array[0..maxn]of longint;
    que:array[0..maxx]of longint;
    h:array[0..maxn]of rec;
function work(root,forbid,k:longint):longint;
var head,tail,i,now,t,num,nowmax:longint;
begin
fillchar(hash,sizeof(hash),0);
from[root]:=0;
head:=1; tail:=1;
que[1]:=root;
dis[root]:=0;
nowmax:=0; num:=0;
hash[root]:=0;
while head<=tail do
  begin
  now:=que[head];
  for i:=1 to edge[now,0] do
      begin
      t:=edge[now,i];
      if (t<>forbid)and(t<>from[now])and(hash[t]=0) then
         begin
         dis[t]:=dis[now]+f[now,i];
         if dis[t]>nowmax then begin nowmax:=dis[t]; num:=t; end;
         inc(tail);
         que[tail]:=t;
         hash[t]:=1;
         from[t]:=now;
         end;
      end;
  inc(head);
  end;
if k=1 then exit(work(num,forbid,2))
   else exit(nowmax);
end;
begin
assign(input,'delete.in');
reset(input);
assign(output,'delete.out');
rewrite(output);
readln(n);
for i:=1 to n-1 do
    begin
    readln(x,y,len);
    h[i].u:=x; h[i].v:=y; h[i].w:=len;
    inc(edge[x,0]); edge[x,edge[x,0]]:=y;
    f[x,edge[x,0]]:=len;
    inc(edge[y,0]); edge[y,edge[y,0]]:=x;
    f[y,edge[y,0]]:=len;
    end;
ans:=0;
for i:=1 to n-1 do
    begin
    t:=work(h[i].u,h[i].v,1)+work(h[i].v,h[i].u,1);
    if t>ans then ans:=t;
    end;
writeln(ans);
close(input);
close(output);
end.
