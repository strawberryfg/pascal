var n,m,i,x,y,w,tot,t1,t2,fmax,num,s,e,t0:longint;
    ans,res:int64;
    f,g,cnt:array[1..50200]of longint;
    done,edge:array[1..10020,0..3010]of longint;
    h:array[1..50200,1..3]of longint;
function dp1(now:longint):longint;
var i,t,ans:longint;
begin
if f[now]<>-1 then exit(f[now]);
ans:=0;
if now=s then exit(1);
for i:=1 to done[now,0] do
    begin
    t:=done[now,i];
    ans:=(ans+dp1(t))mod 10000;
    end;
if (done[now,0]=0) then
   begin
   f[now]:=0;
   end
   else f[now]:=ans;
dp1:=f[now];
end;
function dp2(now:longint):longint;
var i,t,ans:longint;
begin
if g[now]<>-1 then exit(g[now]);
ans:=0;
if now=e then exit(1);
for i:=1 to edge[now,0] do
    begin
    t:=edge[now,i];
    ans:=(ans+dp2(t))mod 10000;
    end;
if edge[now,0]=0 then
   begin
   g[now]:=0;
   end
   else g[now]:=ans;
dp2:=g[now];
end;
begin
assign(input,'road.in');
reset(input);
assign(output,'road.out');
rewrite(output);
readln(n,m,s,e,t0);
for i:=1 to m do
    begin
    readln(x,y,w);
    inc(done[y,0]);
    done[y,done[y,0]]:=x;
    inc(edge[x,0]);
    edge[x,edge[x,0]]:=y;
    inc(tot);
    h[tot,1]:=x; h[tot,2]:=y; h[tot,3]:=w;
    end;
for i:=1 to n do
    begin
    f[i]:=-1; g[i]:=-1;
    end;
ans:=0;
for i:=1 to m do
    begin
    x:=h[i,1]; y:=h[i,2];
    t1:=dp1(x); t2:=dp2(y);
    ans:=(ans+int64(h[i,3])*int64(t1)*int64(t2))mod 10000;
    end;
res:=dp1(e);
ans:=ans+(int64(res)-int64(1))*t0;
writeln(ans mod 10000);
close(input);
close(output);
end.
