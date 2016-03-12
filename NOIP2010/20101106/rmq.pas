var a,b,s,t,n,m,i,sum:longint;
    d,hash,pos:array[1..100]of longint;
    two:array[0..30]of longint;
    edge,f:array[1..100,0..100]of longint;
function min(a,b:longint):longint;
begin
if a<b then exit(a) else exit(b);
end;
function check(a,b:longint):longint;
var i,num:longint;
begin
num:=b-a+1;
for i:=0 to 20 do
    begin
    if (num>=two[i])and(num<two[i+1]) then exit(i);
    end;
end;
procedure work;
var i,j,t:longint;
begin
for i:=1 to sum do f[i,0]:=d[i];
t:=check(1,sum);
for j:=1 to t do
    begin
    for i:=1 to sum+1-j do
        begin
        f[i,j]:=min(f[i,j-1],f[i+two[j-1],j-1]);
        end;
    end;
end;
function fun(x,y:longint):longint;
var a,b,t,len:longint;
begin
a:=pos[x]; b:=pos[y];
len:=check(a,b);
t:=min(f[a,len],f[b-two[len]+1,len]);
exit(t);
end;
procedure dfs(dep:longint);
var i:longint;
begin
inc(sum);
d[sum]:=dep;
if hash[dep]=0 then
   begin
   hash[dep]:=1;
   pos[dep]:=sum;
   end;
if edge[dep,0]=0 then  exit;
for i:=1 to edge[dep,0] do
    begin
    dfs(edge[dep,i]);
    inc(sum);
    d[sum]:=dep;
    end;
end;
begin
assign(input,'rmq.in');
reset(input);
readln(n,m);
two[0]:=1;
for i:=1 to 30 do two[i]:=two[i-1]*2;
for i:=1 to m do
    begin
    readln(a,b);
    inc(edge[a,0]);
    edge[a,edge[a,0]]:=b;
    end;
dfs(1);
work;
readln(s,t);
writeln(fun(s,t));
close(input);
end.