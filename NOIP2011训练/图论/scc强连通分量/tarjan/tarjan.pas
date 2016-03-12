const maxn=100;
var cnt,n,m,i,x,y,tme,top,sum,p:longint;
    belong,stack,dfn,low,finish,d,f:array[1..maxn]of longint;
    instack:array[1..maxn]of boolean;
    edge:array[1..maxn,0..maxn]of longint;
procedure tarjan(u:longint);
var i,v:longint;
begin
inc(sum); d[u]:=sum;
inc(tme); dfn[u]:=tme; low[u]:=tme;
inc(top); instack[u]:=true; stack[top]:=u;
for i:=1 to edge[u,0] do
    begin
    v:=edge[u,i];
    if dfn[v]=0 then
       begin
       tarjan(v);
       if low[v]<low[u] then low[u]:=low[v];
       end
    else if (instack[v])and(dfn[v]<low[u]) then low[u]:=dfn[v];
    end;
if low[u]=dfn[u] then
   begin
   inc(cnt);
   while stack[top+1]<>u do
     begin
     stack[top+1]:=0;
     instack[stack[top]]:=false; belong[stack[top]]:=cnt;
     dec(top);
     end;
   end;
inc(sum); f[u]:=sum;
inc(p); finish[p]:=u;
end;
begin
assign(input,'tarjan.in');
reset(input);
{assign(output,'tarjan.out');
rewrite(output);}
readln(n,m);
for i:=1 to m do
    begin
    readln(x,y); inc(edge[x,0]); edge[x,edge[x,0]]:=y;
    end;
for i:=1 to n do
    begin
    if dfn[i]=0 then tarjan(i);
    end;
for i:=1 to n do writeln(i,'     :',belong[i]);
for i:=p downto 1 do
    begin
    writeln('finish time(top sort):',finish[i],'   :',d[finish[i]],'    ',f[finish[i]]);
    end;
close(input);
close(output);
end.