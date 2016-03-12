var n,m,i,x,y,tot,t1,t2,fmax,num:longint;
    f,g:array[1..50200]of longint;
    done,edge:array[1..5020,0..1010]of longint;
    h:array[1..50200,1..2]of longint;
function dp1(now:longint):longint;
var i,t,ans:longint;
begin
if f[now]<>-1 then exit(f[now]);
ans:=0;
for i:=1 to done[now,0] do
    begin
    t:=done[now,i];
    ans:=ans+dp1(t);
    end;
if done[now,0]=0 then f[now]:=1
   else f[now]:=ans;
dp1:=f[now];
end;
function dp2(now:longint):longint;
var i,t,ans:longint;
begin
if g[now]<>-1 then exit(g[now]);
ans:=0;
for i:=1 to edge[now,0] do
    begin
    t:=edge[now,i];
    ans:=ans+dp2(t);
    end;
if edge[now,0]=0 then g[now]:=1
   else g[now]:=ans;
dp2:=g[now];
end;
begin
assign(input,'traffic.in');
reset(input);
assign(output,'traffic.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
    begin
    readln(x,y);
    inc(done[y,0]);
    done[y,done[y,0]]:=x;
    inc(edge[x,0]);
    edge[x,edge[x,0]]:=y;
    inc(tot);
    h[tot,1]:=x; h[tot,2]:=y;
    end;
for i:=1 to n do
    begin
    f[i]:=-1; g[i]:=-1;
    end;
for i:=1 to m do
    begin
    x:=h[i,1]; y:=h[i,2];
    t1:=dp1(x); t2:=dp2(y);
    if t1*t2>fmax then begin num:=i; fmax:=t1*t2; end;
    end;
writeln(fmax);
close(input);
close(output);
end.