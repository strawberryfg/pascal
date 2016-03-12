const dx:array[1..4]of longint=(-1,1,0,0);
      dy:array[1..4]of longint=(0,0,-1,1);
var ex,ey,n,minx,miny,maxx,maxy,x,y,tail,head,kx,ky,tx,ty,i,j,minn:longint;
    a,f:array[-550..550,-550..550]of longint;
    nowx,nowy:array[1..1000000]of longint;
    vis:array[-550..550,-550..550]of boolean;
    pd:boolean;
function check(c,d:longint):boolean;
begin
if (c<minx)or(c>maxx)or(d<miny)or(d>maxy) then exit(false);
if a[c,d]=1 then exit(false);
exit(true);
end;
begin
assign(input,'mud.in');
reset(input);
assign(output,'mud.out');
rewrite(output);
readln(ex,ey,n);
minx:=0; miny:=0; maxx:=0; maxy:=0;
for i:=1 to n do
    begin
    readln(x,y);
    a[x,y]:=1;
    if x<minx then minx:=x;
    if x>maxx then maxx:=x;
    if y<miny then miny:=y;
    if y>maxy then maxy:=y;
    end;
dec(minx); dec(miny); inc(maxx); inc(maxy);
for i:=minx to maxx do
    for j:=miny to maxy do
        f[i,j]:=maxlongint;
tail:=1; head:=1;
nowx[1]:=0; nowy[1]:=0; minn:=maxlongint;
pd:=true;
f[0,0]:=0;
while (tail<=head) do
  begin
  tx:=nowx[tail]; ty:=nowy[tail];
  for i:=1 to 4 do
      begin
      kx:=tx+dx[i]; ky:=ty+dy[i];
      if (check(kx,ky))and(f[tx,ty]+1<minn)and(f[tx,ty]+1<f[kx,ky]) then
         begin
         f[kx,ky]:=f[tx,ty]+1;
         if (kx=ex)and(ky=ey)and(f[kx,ky]<minn) then minn:=f[kx,ky];
         if vis[kx,ky]=false then
            begin
            inc(head);
            nowx[head]:=kx;
            nowy[head]:=ky;
            vis[kx,ky]:=true;
            end;
         end;
      end;
  inc(tail);
  end;
writeln(minn);
close(input);
close(output);
end.