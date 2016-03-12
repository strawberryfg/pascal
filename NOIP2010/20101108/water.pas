//12:47; 13:04; finish writing; 13:13 13:29 finish testing;
const dx:array[1..4]of longint=(-1,0,0,1);
      dy:array[1..4]of longint=(0,-1,1,0);
      maxn=110; maxm=110;
type rec=record x,y,value:longint; end;
var n,m,i,j,tot,sum:longint;
    g,hash:array[0..maxn,0..maxm]of longint;
    heap:array[1..maxn*maxm]of rec;
procedure up(num:longint);
var tmp:rec;
    now:longint;
begin
now:=num;
while (now div 2>=1)and(heap[now div 2].value>heap[now].value) do
  begin
  tmp:=heap[now div 2]; heap[now div 2]:=heap[now]; heap[now]:=tmp;
  now:=now div 2;
  end;
end;
procedure insert(i,j:longint);
begin
hash[i,j]:=1;
inc(tot);
heap[tot].x:=i; heap[tot].y:=j; heap[tot].value:=g[i,j];
up(tot);
end;
procedure pre;
var i:longint;
begin
for i:=1 to n do
    begin
    insert(i,1);
    insert(i,m);
    end;
for i:=1 to m do
    begin
    insert(1,i);
    insert(n,i);
    end;
end;
procedure down(num:longint);
var now,t1,t2,pnum:longint;
    tmp:rec;
begin
now:=num;
while (now*2<=tot) do
 begin
 t1:=heap[now*2].value; if now*2+1<=tot then t2:=heap[now*2+1].value else t2:=maxlongint;
 if t1<t2 then pnum:=0 else pnum:=1;
 if heap[now].value>heap[now*2+pnum].value then
    begin
    tmp:=heap[now]; heap[now]:=heap[now*2+pnum]; heap[now*2+pnum]:=tmp;
    now:=now*2+pnum;
    end
 else
    break;
 end;
end;
procedure remove(num:longint);
begin
heap[num]:=heap[tot]; heap[tot].x:=0; heap[tot].y:=0; heap[tot].value:=0;
dec(tot);
down(num);
end;
procedure floodfill(nx,ny,key:longint);
var i,tx,ty:longint;
begin
for i:=1 to 4 do
    begin
    tx:=nx+dx[i]; ty:=ny+dy[i];
    if (tx<=0)or(tx>n)or(ty<=0)or(ty>m) then continue;
    if hash[tx,ty]=1 then continue;
    if g[tx,ty]<=key then
       begin
       inc(sum,key-g[tx,ty]);
       hash[tx,ty]:=1;
       floodfill(tx,ty,key);
       end
    else
       begin
       hash[tx,ty]:=1;
       inc(tot);
       heap[tot].x:=tx; heap[tot].y:=ty; heap[tot].value:=g[tx,ty];
       up(tot);
       end;
    end;
end;
begin
assign(input,'water.in');
reset(input);
assign(output,'water.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    begin
    for j:=1 to m do
        begin
        read(g[i,j]);
        end;
    readln;
    end;
pre;
sum:=0;
while tot>0 do
 begin
 floodfill(heap[1].x,heap[1].y,heap[1].value);
 remove(1);
 end;
writeln(sum);
close(input);
close(output);
end.