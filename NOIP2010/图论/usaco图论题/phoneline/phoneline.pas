const maxn=1020; maxm=10200; maxx=1000000;
var tot,n,p,k,i,x,y,l,le,ri,mid,knum:longint;
    a:array[0..maxm]of longint;
    edge,f,g:array[1..maxn,0..maxn]of longint;
    mark:array[1..maxn]of boolean;
    dis:array[1..maxn]of longint;
    que:array[1..maxx]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]<x do
            inc(i);
           while x<a[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
function ok(num:longint):boolean;
var head,tail,i,now,t,tmp:longint;
begin
fillchar(que,sizeof(que),0);
fillchar(mark,sizeof(mark),false);
head:=1; tail:=1; que[1]:=1; mark[1]:=true;
for i:=1 to n do dis[i]:=maxlongint;
dis[1]:=0;
while head<=tail do
  begin
  now:=que[head];
  for i:=1 to edge[now,0] do
      begin
      t:=edge[now,i];
      if f[now,t]>a[num] then tmp:=1 else tmp:=0;
      if (dis[now]+tmp<dis[t]) then
         begin
         dis[t]:=dis[now]+tmp;
         if not mark[t] then
            begin
            inc(tail);
            que[tail]:=t;
            mark[t]:=true;
            end;
         end;
      end;
  inc(head);
  mark[now]:=false;
  end;
if dis[n]<=k then exit(true) else exit(false);
end;
begin
assign(input,'phoneline.in');
reset(input);
assign(output,'phoneline.out');
rewrite(output);
readln(n,p,k);
for i:=1 to p do
    begin
    readln(x,y,l);
    inc(edge[x,0]); edge[x,edge[x,0]]:=y;
    f[x,y]:=l;
    inc(edge[y,0]); edge[y,edge[y,0]]:=x;
    f[y,x]:=l;
    inc(tot); a[tot]:=l;
    end;
sort(1,tot);
a[0]:=0;                                              //特殊处理0的情况 加入a[0]=0
le:=0; ri:=tot;
knum:=-1;
while le<=ri do
  begin
  mid:=(le+ri)div 2;
  if ok(mid) then
     begin
     knum:=mid;
     ri:=mid-1;
     end
  else le:=mid+1;
  end;
if knum<>-1 then writeln(a[knum])      
   else writeln(-1);
close(input);
close(output);
end.