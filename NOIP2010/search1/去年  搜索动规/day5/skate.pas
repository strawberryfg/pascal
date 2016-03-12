var i,n,m,tot,x,y,cnt,res,ans:longint;
    hash,v,f,tf,app:array[1..10000]of longint;
    link:array[1..10000,0..5000]of longint;
    vis,tvis:array[1..10000]of boolean;
procedure work(dep,num,now:longint);
var i,t1,t2,t:longint;
begin
app[num]:=1;
if dep=1 then
   begin
   vis[num]:=true;
   tf:=f; tvis:=vis;
   f[num]:=1;
   res:=1;
   vis[num]:=true;
   for i:=1 to link[num,0] do
       begin
       f[link[num,i]]:=0;
       vis[link[num,i]]:=true;
       end;
   for i:=1 to link[num,0] do
       work(dep+1,link[num,i],0);
   t1:=res; res:=0;
   f:=tf; vis:=tvis;
   f[num]:=0;
   for i:=1 to link[num,0] do
       begin
       f[link[num,i]]:=1;
       vis[link[num,i]]:=true;
       end;
   for i:=1 to link[num,0] do
       work(dep+1,link[num,i],1);
   t2:=res;
   if t1<t2 then res:=t1 else res:=t2;
   end
else
   begin
   if res=maxlongint then exit else res:=res+now;
   for i:=1 to link[num,0] do
       begin
       //if vis[link[num,i]]=true then continue;
       t:=1-now;
       if (f[link[num,i]]<>-1)and(t<>f[link[num,i]]) then
          begin
          res:=maxlongint;
          exit;
          end
       else
          begin
          f[link[num,i]]:=1-now;
          //vis[link[num,i]]:=true;
          end;
       end;
   for i:=1 to link[num,0] do
       if vis[link[num,i]]=false then
          begin
          vis[link[num,i]]:=true;
          work(dep+1,link[num,i],1-now);
          end;
   end;
end;
begin
assign(input,'skate.in');
reset(input);
assign(output,'skate.out');
rewrite(output);
readln(n,m);
tot:=0;
for i:=1 to m do
    begin
    readln(x,y);
    if hash[x]=0 then
       begin
       hash[x]:=1;
       inc(tot);
       v[tot]:=x;
       end;
    if hash[y]=0 then
       begin
       hash[y]:=1;
       inc(tot);
       v[tot]:=y;
       end;
    cnt:=link[x,0]+1; link[x,cnt]:=y; link[x,0]:=cnt;
    cnt:=link[y,0]+1; link[y,cnt]:=x; link[y,0]:=cnt;
    end;
for i:=1 to n do f[i]:=-1;
work(1,v[1],0);
ans:=res;
n:=tot;
if res<>maxlongint then
for i:=2 to n do
    begin
    if app[v[i]]=0 then work(1,v[i],0) else continue;
     if res=maxlongint then begin ans:=maxlongint;break;end else ans:=ans+res;
    end;
if ans=maxlongint then writeln('Impossible') else writeln(ans);
close(input);
close(output);
end.
