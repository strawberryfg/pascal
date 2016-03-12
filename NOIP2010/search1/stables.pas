var i,j,m,n,t,tot,t1,t2,sum,now,ans:longint;
    num,f:array[1..1641,1..1641]of longint;
    fan,edge:array[1..10000,1..3]of longint;
    hash,a:array[1..1641]of longint;
    used:array[1..10000]of boolean;
    pd:boolean;
function getnum(i,j:longint):longint;
begin
getnum:=(i-1)*n+j;
end;
function min(x,y:longint):longint;
begin
if a[x]<a[y] then exit(a[x]) else exit(a[y]);
end;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=edge[(l+r) div 2,3];
         repeat
           while edge[i,3]<x do
            inc(i);
           while x<edge[j,3] do
            dec(j);
           if not(i>j) then
             begin
                y:=edge[i,1];
                edge[i,1]:=edge[j,1];
                edge[j,1]:=y;
                y:=edge[i,2];
                edge[i,2]:=edge[j,2];
                edge[j,2]:=y;
                y:=edge[i,3];
                edge[i,3]:=edge[j,3];
                edge[j,3]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
begin
assign(input,'stables.in');
reset(input);
assign(output,'stables.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
    begin
    for j:=1 to n do
        begin
        t:=getnum(i,j);
        read(a[t]); num[i,j]:=t; fan[t,1]:=i; fan[t,2]:=j;
        if (i-1>0)  then
           begin
           inc(tot);
           edge[tot,1]:=getnum(i-1,j);
           edge[tot,2]:=t;
           t1:=edge[tot,1]; t2:=edge[tot,2];
           f[t1,t2]:=min(t1,t2);
           edge[tot,3]:=f[t1,t2];
           end;
        if (j-1>0) then
           begin
           inc(tot);
           edge[tot,1]:=getnum(i,j-1);
           edge[tot,2]:=t;
           t1:=edge[tot,1]; t2:=edge[tot,2];
           f[t1,t2]:=min(t1,t2);
           edge[tot,3]:=f[t1,t2];
           end;
        end;
    readln;
    end;
sort(1,tot);
sum:=0; now:=0;
while (sum<m*n) do
  begin
  now:=1;
  t1:=hash[edge[now,1]]; t2:=hash[edge[now,2]];
  pd:=used[now];
  while ((sum=0)and(edge[now,1]<>1)and(edge[now,2]<>1)and(now<=tot))
        or((sum<>0)and(t1+t2<>1)and(now<=tot))or(pd=true) do
    begin
    t1:=hash[edge[now,1]]; t2:=hash[edge[now,2]];
    if t1+t2=1 then break;
    pd:=used[now+1];
    inc(now);
    end;
  used[now]:=true;
  ans:=ans+edge[now,3];
   inc(sum,2-t1-t2);
  if t1=0 then hash[edge[now,1]]:=1;
  if t2=0 then hash[edge[now,2]]:=1;
  end;
writeln(ans);
close(input);
close(output);
end.
