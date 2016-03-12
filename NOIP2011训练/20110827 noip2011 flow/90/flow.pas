//20:51; 21:02;finish writing; 21:07; 22:24 AC 9 testdata
const dx:array[1..4]of longint=(-1,0,0,1);
      dy:array[1..4]of longint=(0,-1,1,0);
      maxn=520; maxm=520; maxx=1000020;
var n,m,i,j,cnt:longint;
    g,hash,vis:array[0..maxn,0..maxm]of longint;
    le,ri,f:array[0..maxm]of longint;
    a:array[1..maxx,1..2]of longint;
    flag:boolean;
procedure dfs(p:longint);
var head,tail,fmin,fmax,x,y,tx,ty,i:longint;
begin
head:=1; tail:=1; a[1,1]:=1; a[1,2]:=p;
hash[1,p]:=1;
fmin:=maxlongint;
fmax:=-maxlongint;
if n=1 then begin vis[1,p]:=1; fmin:=p; fmax:=p; end;   // solve case# n=1
while head<=tail do
  begin
  x:=a[head,1]; y:=a[head,2];
  for i:=1 to 4 do
      begin
      tx:=x+dx[i];
      ty:=y+dy[i];
      if (tx<=0)or(tx>n)or(ty<=0)or(ty>m) then continue;
      if hash[tx,ty]=1 then continue;
      if g[x,y]>g[tx,ty] then
         begin
         inc(tail);
         a[tail,1]:=tx; a[tail,2]:=ty;
         hash[tx,ty]:=1;
         if (tx=n) then
            begin
            vis[n,ty]:=1;
            if ty<fmin then fmin:=ty;
            if ty>fmax then fmax:=ty;
            end;
         end;
      end;
  inc(head);
  end;
le[p]:=fmin; ri[p]:=fmax;
end;
procedure sort(l,r: longint);
      var i,j,tt,tmp: longint;
      begin
         i:=l; j:=r; tt:=le[(l+r) div 2];
         repeat
           while le[i]<tt do inc(i);
           while tt<le[j] do dec(j);
           if not(i>j) then
             begin
                tmp:=le[i]; le[i]:=le[j]; le[j]:=tmp;
                tmp:=ri[i]; ri[i]:=ri[j]; ri[j]:=tmp;
                inc(i); dec(j);
             end;
         until i>j;
         if l<j then sort(l,j);
         if i<r then sort(i,r);
end;
function min(ta,tb:longint):longint;
begin
if ta<tb then exit(ta) else exit(tb);
end;
begin
assign(input,'flow.in');
reset(input);
assign(output,'flow.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    begin
    for j:=1 to m do
        read(g[i,j]);
    readln;
    end;
for i:=1 to m do
    begin
    fillchar(hash,sizeof(hash),0);             //memset important!!!!!!
    dfs(i);
    end;
flag:=true;
cnt:=0;
for i:=1 to m do if vis[n,i]=0 then begin flag:=false; inc(cnt); end;
if not flag then
   begin
   writeln(0);
   writeln(cnt);
   end
else
   begin
   sort(1,m);
   f[0]:=0;
   for i:=1 to m do f[i]:=maxlongint;
   for i:=1 to m do
       begin
       for j:=le[i] to ri[i] do
           begin
           f[j]:=min(f[j],f[le[i]-1]+1);
           end;
       end;
   writeln(1);
   writeln(f[m]);
   end;
close(input);
close(output);
end.