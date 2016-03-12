const dx:array[1..4]of longint=(-1,1,0,0);
      dy:array[1..4]of longint=(0,0,-1,1);
var maxn,n,m,t,r1,r2,c1,c2,tail,head,tx,ty,fx,fy,i,j,ans,hou,qian:longint;
    a:array[1..100,1..100]of longint;
    nowx,nowy,time:array[1..8000000]of longint;
    st:char;
function calc(a,b,c,d:longint):longint;
begin
exit(abs(a-c)+abs(b-d));
end;
begin
assign(input,'ctravel.in');
reset(input);
assign(output,'ctravel.out');
rewrite(output);
readln(n,m,t);
maxn:=8000000;
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        read(st);
        if st='.' then a[i,j]:=1 else a[i,j]:=2; //2:tree; 1:grass;
        end;
    readln;
    end;
readln(r1,c1,r2,c2);
tail:=1; head:=1; nowx[1]:=r1; nowy[1]:=c1;
hou:=1; qian:=1;
while ((hou=qian)and(tail<=head))or(hou<qian) do
  begin
  tx:=nowx[tail];
  ty:=nowy[tail];
  for i:=1 to 4 do
      begin
      fx:=tx+dx[i]; fy:=ty+dy[i];
      if (fx<=0)or(fx>n)or(fy<=0)or(fy>m) then continue;
      if a[fx,fy]=2 then continue;
      if calc(fx,fy,r2,c2)+time[tail]>t then continue;
      inc(head);
      if head>maxn then begin inc(qian);head:=1; end;
      time[head]:=time[tail]+1;
      nowx[head]:=fx; nowy[head]:=fy;
      if (fx=r2)and(fy=c2) then inc(ans);
      end;
  inc(tail);
  if tail>maxn then begin inc(hou); tail:=1; end;
  end;
writeln(ans);
close(input);
close(output);
end.