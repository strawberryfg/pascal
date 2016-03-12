var t,knum,dep,n,k,i,j,x,y,len,tobelog,fr,en,t1,t2:longint;
    d,pos,fa:array[1..270000]of longint;
    two:array[0..25]of longint;
    f:array[1..270000,0..19]of longint;
    edge:array[1..61725,0..100]of longint;
function check(num:longint):longint;
var i:longint;
begin
for i:=0 to 18 do if (num>=two[i])and(num<two[i+1]) then exit(i);
end;
procedure dfs(now:longint);
var i,t:longint;
begin
inc(dep);
d[dep]:=now;
pos[now]:=dep;
for i:=1 to edge[now,0] do
    begin
    t:=edge[now,i];
    if t=now then continue;
    dfs(t);
    inc(dep);
    d[dep]:=now;
    end;
end;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
function find(num:longint):longint;
begin
if fa[num]=num then exit(num);
fa[num]:=find(fa[num]);
exit(fa[num]);
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
for i:=1 to 19 do two[i]:=two[i-1]*2;
for i:=0 to 18 do if (dep>=two[i])and(dep<two[i+1]) then begin knum:=i;break; end;
for i:=1 to dep do f[i,0]:=d[i];
for j:=1 to knum do
    begin
    for i:=1 to dep+1-j do
        begin
        f[i,j]:=min(f[i,j-1],f[i+two[j-1],j-1]);
        end;
    end;
for i:=1 to k do
    begin
    readln(x,y);        // y is the father of x
    if x=y then begin writeln('Y');continue; end;
    fr:=pos[y]; en:=pos[x];
    if fr>en then begin writeln('N'); continue; end;
    len:=en-fr+1;
    tobelog:=check(len);
    t:=min(f[fr,tobelog],f[en+1-two[tobelog],tobelog]);
    if t=y then writeln('Y') else writeln('N');
    end;
close(input);
close(output);
end.
