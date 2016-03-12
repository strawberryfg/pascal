const dx:array[0..4]of longint=(0,-1,0,0,1);
      dy:array[0..4]of longint=(0,0,-1,1,0);
      maxn=100;maxm=100;
var n,m,i,j,k,sum,fmax:longint;
    ch:char;
    g:array[1..maxn,1..maxm,1..4,1..4]of longint;
    hash,belong:array[-1..maxn,-1..maxm,1..4]of longint;
    cnt,mark:array[0..maxn*maxm]of longint;
procedure work(i,j,k:longint);
begin
if k=1 then hash[i-1,j,5-k]:=1;
if k=2 then hash[i,j-1,5-k]:=1;
if k=3 then hash[i,j+1,5-k]:=1;
if k=4 then hash[i+1,j,5-k]:=1;
end;
procedure dfs(x,y,point:longint);
var i,tx,ty,j:longint;
begin
belong[x,y,point]:=sum;
for i:=0 to 4 do
    begin
    tx:=x+dx[i]; ty:=y+dy[i];
    if (tx<=0)or(tx>n)or(ty<=0)or(ty>m) then continue;
    if (point=2)and((i=1)or(i=3)or(i=4)) then continue;
    if (point=3)and((i=1)or(i=2)or(i=4)) then continue;
    if (point=1)and((i=2)or(i=3)or(i=4)) then continue;
    if (point=4)and((i=1)or(i=2)or(i=3)) then continue;
    for j:=1 to 4 do
        begin

        if ((i>0)and(g[tx,ty,5-point,j]=1))or((i=0)and(g[tx,ty,point,j]=1))
         then
           begin
           if (hash[tx,ty,j]=1) then
              begin
              if i>0 then mark[sum]:=1;
              end
              else begin
                   hash[tx,ty,j]:=1;
                   work(tx,ty,j);
                   dfs(tx,ty,j);
                   end;
           end;
        end;
    end;
end;
begin
assign(input,'floor.in');
reset(input);
assign(output,'floor.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    begin
    for j:=1 to m do
        begin
        read(ch);
        if ch='A' then
           begin
           g[i,j,1,2]:=1; g[i,j,3,4]:=1;
           g[i,j,2,1]:=1; g[i,j,4,3]:=1;
           end
        else begin
             g[i,j,1,3]:=1; g[i,j,2,4]:=1;
             g[i,j,3,1]:=1; g[i,j,4,2]:=1;
             end;
        end;
    readln;
    end;
sum:=0; fmax:=0;
for i:=1 to n do
    begin
    for j:=1 to m do
        begin
        for k:=1 to 4 do
            begin
            if hash[i,j,k]=0 then
               begin
               inc(sum);
               hash[i,j,k]:=1;
               work(i,j,k);
               dfs(i,j,k);
               end;
            end;
        end;
    end;
fmax:=0;
for i:=1 to n do
    for j:=1 to m do
        begin
        for k:=1 to 4 do
            begin
            inc(cnt[belong[i,j,k]]);
            end;
        end;
for i:=1 to sum do if cnt[i]+mark[i]-1>fmax then fmax:=cnt[i]+mark[i]-1;
writeln(sum,' ',fmax);
close(input);
close(output);
end.