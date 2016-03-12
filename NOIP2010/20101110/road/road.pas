const maxx=1000020; maxn=2500;
var n,m,a,b,i,fmax,num:longint;
    q:array[1..maxx]of longint;
    dis:array[1..maxn]of longint;
    mark:array[1..maxn]of boolean;
    edge:array[1..maxn,0..maxn]of longint;
procedure spfa(s:longint);
var now,head,tail,i,sum:longint;
begin
q[1]:=s;
fillchar(mark,sizeof(mark),false);
mark[s]:=true;
head:=1; tail:=1;
for i:=1 to n do dis[i]:=maxlongint;
dis[s]:=0;
while head<=tail do
  begin
  now:=q[head];
  for i:=1 to edge[now,0] do
      begin
      if dis[now]+1<dis[edge[now,i]] then
         begin
         dis[edge[now,i]]:=dis[now]+1;
         if not mark[edge[now,i]] then
            begin
            inc(tail);
            q[tail]:=edge[now,i];
            mark[edge[now,i]]:=true;
            end;
         end;
      end;
  inc(head);
  mark[now]:=false;
  end;
sum:=0;
for i:=1 to n do inc(sum,dis[i]);
if sum>fmax then begin fmax:=sum; num:=s; end;
end;
begin
assign(input,'road.in');
reset(input);
assign(output,'road.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
    begin
    readln(a,b);
    inc(edge[a,0]);
    edge[a,edge[a,0]]:=b;
    inc(edge[b,0]);
    edge[b,edge[b,0]]:=a;
    end;
for i:=1 to n do
    spfa(i);
writeln(num);
close(input);
close(output)
end.