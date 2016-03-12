var n,m,x,y,t,i,j,k,sum,tot,top,time,final,zong:longint;
    vis:array[1..10000]of boolean;
    colour,stack,low,rea,shu:array[1..10000]of integer;
    f:array[1..10000,0..10000]of integer;
    hash:array[1..10000,0..10000]of byte;
    edge:array[1..10000,0..10000]of integer;
    pd,mark:boolean;
function min(a,b:longint):longint;
begin
if a<b then exit(a) else exit(b);
end;
procedure dfs(dep:longint);
var i:longint;
begin
colour[dep]:=1;
inc(top);
stack[top]:=dep;
inc(time);
low[dep]:=time;
rea[dep]:=time;
vis[dep]:=true;
for i:=1 to edge[dep,0] do
    begin
    if colour[edge[dep,i]]=0 then
       dfs(edge[dep,i]);
    if colour[edge[dep,i]]<2 then
       low[dep]:=min(low[dep],low[edge[dep,i]]);
    end;
if rea[dep]=low[dep] then
   begin
   inc(tot);
   sum:=0;
   while stack[top+1]<>dep do
     begin
     inc(sum);
     f[tot,sum]:=stack[top];
     hash[tot,stack[top]]:=1;
     colour[stack[top]]:=2;
     dec(top);
     end;
   f[tot,0]:=sum;
   end;
end;
begin
assign(input,'cow.in');
reset(input);
assign(output,'cow.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
  begin
  readln(x,y);
  inc(edge[x,0]);
  edge[x,edge[x,0]]:=y;
  end;
for i:=1 to n do vis[i]:=false;
for i:=1 to n do
    begin
    if vis[i]=false then
       dfs(i);
    end;
pd:=true;
zong:=0;
for i:=1 to tot do
    begin
    mark:=true;
    for j:=1 to f[i,0] do
        begin
        t:=f[i,j];
        for k:=1 to edge[t,0] do
            if (hash[i,edge[t,k]]=0) then begin mark:=false;break; end;
        if not mark then break;
        end;
    if mark then
       begin
       inc(zong);
       final:=f[i,0];
       end;
    if zong>1 then begin pd:=false;break; end;
    end;
if not pd then writeln(0) else writeln(final);
close(input);
close(output);
end.