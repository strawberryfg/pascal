const maxn=2000;
var n,m,i,x,y,c,le,ri,mid,ans:longint;
    flag:boolean;
    a:array[1..maxn]of longint;
    edge,f:array[1..maxn,0..maxn]of longint;
procedure dfs(now,value:longint);
var t,tmp,i:longint;
begin
if value>mid then exit;
if (now=n) then begin flag:=true; exit; end;
for i:=1 to edge[now,0] do
    begin
    t:=edge[now,i];
    tmp:=value-f[now,i];
    if tmp<0 then tmp:=0;
    tmp:=tmp+a[t];
    dfs(t,tmp);
    if flag then exit;
    end;
end;
begin
assign(input,'fruit.in');
reset(input);
assign(output,'fruit.out');
rewrite(output);
readln(n,m);
for i:=1 to n do read(a[i]);
for i:=1 to m do
    begin
    readln(x,y,c);
    inc(edge[x,0]);
    edge[x,edge[x,0]]:=y;
    f[x,edge[x,0]]:=c;
    end;
le:=1; ri:=2000000000;
while le<=ri do
  begin
  mid:=(le+ri)div 2;
  flag:=false;
  dfs(1,a[1]);
  if flag then begin ans:=mid; ri:=mid-1; end
     else le:=mid+1;
  end;
writeln(ans);
close(input);
close(output);
end.