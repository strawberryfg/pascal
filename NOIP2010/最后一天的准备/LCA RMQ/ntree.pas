//19:14
var n,k,i,j,t,len,x,y,a,b,ans,sum:longint;
    f:array[1..270000,0..24]of longint;
    edge:array[1..123488,0..100]of longint;
    d,pos:array[1..270000]of longint;
    two:array[0..24]of longint;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
function check(num:longint):longint;
var i:longint;
begin
for i:=0 to 24 do
    begin
    if (num>=two[i])and(num<two[i+1]) then exit(i);
    end;
end;
procedure dfs(now:longint);
var i,t:longint;
begin
inc(sum);
d[sum]:=now;
pos[now]:=sum;
for i:=1 to edge[now,0] do
    begin
    t:=edge[now,i];
    dfs(t);
    inc(sum);
    d[sum]:=now;
    end;
end;
begin
assign(input,'ntree.in');
reset(input);
assign(output,'ntree.out');
rewrite(output);
readln(n,k);
for i:=1 to n-1 do
    begin
    read(x);
    inc(edge[x,0]);
    edge[x,edge[x,0]]:=i+1;
    end;
dfs(1);
two[0]:=1;
for i:=1 to 24 do two[i]:=two[i-1]*2;
for i:=1 to sum do f[i,0]:=d[i];
t:=check(sum);
for i:=1 to t do
    begin
    for j:=1 to sum+1-i do
        begin
        f[j,i]:=min(f[j,i-1],f[j+two[i-1],i-1]);
        end;
    end;
for i:=1 to k do
    begin
    readln(x,y);       //if y is the ancestor of x;
    if x=y then begin writeln('Y');continue; end;
    a:=pos[x]; b:=pos[y];
    if b>a then begin writeln('N');continue; end;
    len:=a-b+1;
    t:=check(len);
    ans:=min(f[b,t],f[a+1-two[t],t]);
    if ans=y then writeln('Y')
             else writeln('N');
    end;
close(input);
close(output);
end.
