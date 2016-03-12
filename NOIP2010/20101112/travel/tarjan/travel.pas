const maxn=120;   maxm=1000000; maxk=10;
var n,m,k,x,y,len,cnt,tme,top,i,j,ans:longint;
    stack,dfn,low,belong:array[1..maxn]of longint;
    instack:array[1..maxn]of boolean;
    edge,v:array[1..maxn,0..100*maxn]of longint;
    que,w:array[1..maxm]of longint;
    mark:array[1..maxn,0..maxk]of boolean;
    f:array[1..maxn,0..maxk]of longint;
procedure tarjan(x:longint);
var i,t:longint;
begin
inc(tme); dfn[x]:=tme; low[x]:=tme;
inc(top); stack[top]:=x; instack[x]:=true;
for i:=1 to edge[x,0] do
    begin
    t:=edge[x,i];
    if dfn[t]=0 then
       begin
       tarjan(t);
       if low[t]<low[x] then low[x]:=low[t];
       end
    else if (instack[t])and(dfn[t]<low[x]) then low[x]:=dfn[t];
    end;
if dfn[x]=low[x] then
   begin
   inc(cnt);
   while stack[top+1]<>x do
     begin
     stack[top+1]:=0;
     instack[stack[top]]:=false;
     belong[stack[top]]:=cnt;
     dec(top);
     end;
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
    end;
for i:=1 to n do
    begin
    if dfn[i]=0 then tarjan(i);
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
