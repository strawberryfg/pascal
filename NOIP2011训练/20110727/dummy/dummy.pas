const maxn=120; maxm=50020;
      dx:array[1..4]of longint=(0,1,0,-1);
      dy:array[1..4]of longint=(1,0,-1,0);
var n,k,i,l,t,x,tme,dir,y,tx,ty,r,c,len:longint;
    a,map:array[1..maxn,1..maxn]of longint;
    g:array[1..maxm]of longint;
    q:array[1..maxm,1..2]of longint;
    ts,ss:string;
    code:integer;
begin
assign(input,'dummy.in');
reset(input);
assign(output,'dummy.out');
rewrite(output);
readln(n);
readln(k);
for i:=1 to k do
    begin
    readln(r,c);
    a[r,c]:=1;
    end;
readln(l);
for i:=1 to l do
    begin
    readln(ss);
    t:=pos(' ',ss);
    ts:=copy(ss,1,t-1);
    val(ts,x,code);
    delete(ss,1,t);
    if ss='L' then g[x]:=-1 else g[x]:=1;
    end;
x:=1; y:=1; tme:=0; dir:=1;
len:=1;
while true do
 begin
 inc(tme);
 tx:=x+dx[dir]; ty:=y+dy[dir];
 if (tx<=0)or(tx>n)or(ty<=0)or(ty>n) then break;
 if (map[tx,ty]>0)and(map[tx,ty]>tme-len) then break;
 if (a[tx,ty]=1) then
    begin
    inc(len);
    a[tx,ty]:=0;
    end;
 if g[tme]=-1 then dec(dir);
 if g[tme]=1 then inc(dir);
 if dir=0 then dir:=4; if dir=5 then dir:=1;
 map[tx,ty]:=tme+1;
 x:=tx;
 y:=ty;
 end;
writeln(tme);
close(input);
close(output);
end.
