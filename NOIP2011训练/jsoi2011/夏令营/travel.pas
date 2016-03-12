const maxn=120;
type rec=array[0..maxn]of longint;
var n,k,i,x,y,sum,total,p,q,l,r,mid,tt,ans:longint;
    a,b,hash:rec;
    edge:array[0..maxn,0..maxn]of longint;
    flag:boolean;
procedure dfs(num,w,f:longint;hash:rec);
var i,tmp:longint;
begin
if (num=q)and(f>ans) then begin ans:=f; exit; end;
if num=q then exit;
for i:=1 to edge[num,0] do
    begin
    tmp:=edge[num,i];
    if hash[tmp]=1 then continue;
    if (w+a[tmp]<=k) then
       begin
       hash[tmp]:=1;
       dfs(tmp,w+a[tmp],f+b[tmp],hash);
       //if flag then exit;
       hash[tmp]:=0;
       end;
    hash[tmp]:=1;
    dfs(tmp,w,f,hash);
    //if flag then exit;
    hash[tmp]:=0;
    end;
end;
begin
assign(input,'travel.in');
reset(input);
assign(output,'travel.out');
rewrite(output);
readln(n,k);
for i:=1 to n-1 do
    begin
    readln(x,y);
    inc(edge[x,0]);
    edge[x,edge[x,0]]:=y;
    inc(edge[y,0]);
    edge[y,edge[y,0]]:=x;
    end;
for i:=1 to n do read(a[i]);
sum:=0;
for i:=1 to n do
    begin
    read(b[i]);
    inc(sum,b[i]);
    end;
readln(total);
for i:=1 to total do
    begin
    ans:=0;
    readln(p,q);
    edge[0,0]:=1; edge[0,1]:=p;
    {l:=0; r:=sum;
    while l<=r do
      begin
      mid:=(l+r) div 2;
      flag:=false;
      edge[0,0]:=1; edge[0,1]:=p;
      dfs(0,0,0,hash);
      if flag then
         begin
         tt:=mid;
         l:=mid+1;
         end
      else r:=mid-1;
      end;
    writeln(tt);}
    dfs(0,0,0,hash);
    writeln(ans);
    end;
close(input);
close(output);
end.
