const maxn=120; maxx=1000020;
var n,i,j:longint;
    le,ri,mid:double;
    que:array[1..maxx]of longint;
    mark:array[1..maxn]of boolean;
    dis:array[1..maxn]of double;
    a,t:array[1..maxn,1..maxn]of longint;
    f:array[1..maxn,1..maxn]of double;
    hash:array[1..maxn]of longint;
function ok(x:double):boolean;
var i,j,head,tail,now:longint;
begin
for i:=1 to n do
    for j:=1 to n do
        begin
        f[i,j]:=a[i,j]-x*t[i,j];
        end;
fillchar(hash,sizeof(hash),0);
fillchar(mark,sizeof(mark),false);
for i:=1 to n do dis[i]:=-maxlongint;
dis[1]:=0;
head:=1; tail:=1;
mark[1]:=true;
que[1]:=1;
while head<=tail do
  begin
  now:=que[head];
  for i:=1 to n do
      begin
      if now<>i then
         begin
         if dis[now]+f[now,i]>dis[i] then
            begin
            dis[i]:=dis[now]+f[now,i];
            if not mark[i] then
               begin
               mark[i]:=true;
               inc(tail);
               que[tail]:=i;
               inc(hash[i]);
               if hash[i]>n then exit(true);
               end;
            end;
         end;
      end;
  mark[now]:=false;
  inc(head);
  end;
if dis[n]>=0 then exit(true);
exit(false);
end;
begin
assign(input,'tour.in');
reset(input);
assign(output,'tour.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        read(a[i,j]);
    readln;
    end;
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        read(t[i,j]);
        end;
    readln;
    end;
le:=0;
ri:=100000000;
while ri-le>1e-5 do
  begin
  mid:=(le+ri)/2;
  if ok(mid) then le:=mid
     else ri:=mid;
  end;
writeln(mid:0:3);
close(input);
close(output);
end.