const inf=100000; maxn=1020; maxm=10020; maxx=3000000;
var n,m,x,y,i,l,s,e,tot,kk:longint;
    edge,edge2,f,g:array[1..maxn,0..maxm]of longint;
    dis,cnt:array[1..maxn,0..1]of longint;
    mark:array[1..maxn,0..1]of boolean;
    q,flag:array[1..maxx]of longint;
function calc(x,sta:longint):longint;
var ans,i,t:longint;
begin
if edge2[x,0]=0 then exit(1);
if sta=0 then
   begin
   ans:=0;
   for i:=1 to edge2[x,0] do
       begin
       t:=edge2[x,i];
       if dis[t,0]+g[x,i]=dis[x,0] then inc(ans,calc(t,0));
       end;
   exit(ans);
   end
else
   begin
   ans:=0;
   for i:=1 to edge2[x,0] do
       begin
       t:=edge2[x,i];
       if dis[t,0]+g[x,i]=dis[x,1] then inc(ans,calc(t,0));
       if dis[t,1]+g[x,i]=dis[x,1] then inc(ans,calc(t,1));
       end;
   exit(ans);
   end;
end;
procedure spfa(s,e:longint);
var i,j,now,u,t,head,tail,sum:longint;
begin
for i:=1 to n do
    begin
    dis[i,0]:=inf; dis[i,1]:=inf;
    cnt[i,0]:=0; cnt[i,1]:=0;
    end;
fillchar(mark,sizeof(mark),false);
dis[s,0]:=0;
head:=1; tail:=1;
q[1]:=s; flag[1]:=0;
mark[s,0]:=true;
while head<=tail do
 begin
 now:=q[head];
 u:=flag[head];
 for i:=1 to edge[now,0] do
     begin
     t:=edge[now,i];
     if u=0 then
        begin
        if dis[now,0]+f[now,i]<dis[t,0] then
           begin
           dis[t,1]:=dis[t,0];
           dis[t,0]:=dis[now,0]+f[now,i];
           if not mark[t,0] then
              begin
              inc(tail);
              q[tail]:=t;
              flag[tail]:=0;
              mark[t,0]:=true;
              end;
           end;
        if dis[now,0]+f[now,i]<dis[t,1] then
           begin
	   if dis[now,0]+f[now,i]>dis[t,0] then
	      begin
              dis[t,1]:=dis[now,0]+f[now,i];
              if not mark[t,1] then
                 begin
                 inc(tail);
                 q[tail]:=t;
                 flag[tail]:=1;
                 mark[t,1]:=true;
                 end;
              end;
	   end;
        end
     else
        begin
        if dis[now,1]+f[now,i]<dis[t,1] then
           begin
	   if dis[now,1]+f[now,i]>dis[t,0] then
	      begin
              dis[t,1]:=dis[now,1]+f[now,i];
              if not mark[t,1] then
                 begin
                 inc(tail);
                 q[tail]:=t;
                 flag[tail]:=1;
                 mark[t,1]:=true;
                 end;
              end
	   end;
        end;
     end;
 mark[now,u]:=false;
 inc(head);
 end;
for i:=1 to n do
    begin
    for j:=0 to 1 do
        begin
        if cnt[i,j]=0 then cnt[i,j]:=calc(i,j);
        end;
    end;
sum:=cnt[e,0];
if dis[e,1]=dis[e,0]+1 then inc(sum,cnt[e,1]);
writeln(sum);
end;
begin
{assign(input,'seeing.in');
reset(input);
assign(output,'seeing.out');
rewrite(output);}
readln(tot);
for kk:=1 to tot do
    begin
    readln(n,m);
    for i:=1 to n do begin edge[i,0]:=0; edge2[i,0]:=0; end;
    for i:=1 to m do
        begin
        readln(x,y,l);
        inc(edge[x,0]);
        edge[x,edge[x,0]]:=y;
        f[x,edge[x,0]]:=l;
        inc(edge2[y,0]);
        edge2[y,edge2[y,0]]:=x;
        g[y,edge2[y,0]]:=l;
        end;
    readln(s,e);
    spfa(s,e);
    end;
{close(input);
close(output);}
end.
