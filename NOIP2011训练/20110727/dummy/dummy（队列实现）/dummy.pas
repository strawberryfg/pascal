const maxn=120; maxm=50020;
      dx:array[1..4]of longint=(0,1,0,-1);
      dy:array[1..4]of longint=(1,0,-1,0);
var n,k,i,l,t,x,head,tail,tmp,tme,dir,y,tx,ty,r,c:longint;
    hash,a:array[1..maxn,1..maxn]of longint;
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
head:=1; tail:=1; tme:=0; dir:=1;
x:=1; y:=1;  hash[1,1]:=1;
q[1,1]:=1; q[1,2]:=1;
while true do
  begin
  inc(tme);
  tx:=x+dx[dir]; ty:=y+dy[dir];
  if (tx<=0)or(tx>n)or(ty<=0)or(ty>n) then
     begin tmp:=tme; break; end;
  if hash[tx,ty]=1 then begin tmp:=tme; break; end;
  if a[tx,ty]=1 then
     begin
     a[tx,ty]:=0;
     hash[tx,ty]:=1;   inc(tail); q[tail,1]:=tx; q[tail,2]:=ty;
     end
  else
     begin
     hash[q[head,1],q[head,2]]:=0;
     inc(head);
     hash[tx,ty]:=1;   inc(tail); q[tail,1]:=tx; q[tail,2]:=ty;
     end;
  x:=tx; y:=ty;
  if g[tme]=-1 then dec(dir);
  if g[tme]=1 then inc(dir);
  if dir=0 then dir:=4; if dir=5 then dir:=1;
  end;
writeln(tmp);
close(input);
close(output);
end.
