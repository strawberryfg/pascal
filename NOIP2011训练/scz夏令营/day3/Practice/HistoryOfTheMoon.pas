//22:11; 22:26;
const maxn=100020;
type rec=record l,r,max,cover:longint; end;
var n,i,t,num,x,y,ta,tb,j,sum,cnt,total:longint;
    code:integer;
    ss,ts:string;
    a:array[1..maxn*2]of longint;
    g:array[1..maxn,0..2]of longint;
    m:array[1..10*maxn]of rec;
    lian:array[1..maxn*2,1..3]of longint;
    hash:array[0..999985]of longint;
procedure init(f,t,x:longint);
begin
m[x].l:=f; m[x].r:=t;
if f=t then exit;
init(f,(f+t)div 2,x*2);
init((f+t)div 2+1,t,x*2+1);
end;
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
function querysum(f,t,x:longint):longint;
var ans,mid:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then
   exit(m[x].cover)
else
   begin
   mid:=(m[x].l+m[x].r)div 2;
   ans:=0;
   if f<=mid then inc(ans,querysum(f,t,x*2));
   if t>mid then inc(ans,querysum(f,t,x*2+1));
   exit(ans);
   end;
end;
procedure solve(num,ind:longint);
var mo,now:longint;
begin
mo:=num mod 999983;
if hash[mo]=0 then
   begin
   inc(total);
   hash[mo]:=total;
   lian[total,1]:=num div 999983;
   lian[total,3]:=cnt;
   end
else
   begin
   now:=hash[mo];
   if lian[now,1]=num div 999983 then
      begin
      t:=lian[now,3];
      exit;
      end;

   while (lian[now,2]<>0) do
      begin
      now:=lian[now,2];
      if lian[now,1]=num div 999983 then
         begin
         t:=lian[now,3];
         exit;
         end;
      end;
   inc(total);
   lian[now,2]:=total;
   lian[total,1]:=num div 999983;
   lian[total,3]:=cnt;
   end;
end;
procedure insert(f,t,x:longint);
var mid:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then
   inc(m[x].cover)
else
   begin
   mid:=(m[x].l+m[x].r)div 2;
   if f<=mid then insert(f,t,x*2);
   if t>mid then insert(f,t,x*2+1);
   m[x].cover:=m[x*2].cover+m[x*2+1].cover;
   end;
end;
begin
assign(input,'HistoryOfTheMoon.in');
reset(input);
assign(output,'HistoryOfTheMoon.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(ss);
    t:=pos(' ',ss);
    if t=0 then
       begin
       val(ss,num,code);
       inc(sum); a[sum]:=num;
       g[i,0]:=1; g[i,1]:=num;
       end
    else
       begin
       ts:=copy(ss,1,t-1);
       val(ts,x,code);
       inc(sum); a[sum]:=x;
       delete(ss,1,t);
       val(ss,y,code);
       inc(sum); a[sum]:=y;
       g[i,0]:=2; g[i,1]:=x; g[i,2]:=y;
       end;
    end;
sort(1,sum);
cnt:=0;
i:=1;
while (i<=sum) do
  begin
  j:=i;
  while (j+1<=sum)and(a[j+1]=a[i]) do inc(j);
  inc(cnt);
  solve(a[i],1);
  i:=j+1;
  end;
init(1,cnt,1);
for i:=1 to n do
    begin
    if g[i,0]=1 then
       begin
       t:=0;
       solve(g[i,1],2);
       insert(t,t,1);
       end
    else
       begin
       t:=0;
       solve(g[i,1],2);
       ta:=t;
       t:=0;
       solve(g[i,2],2);
       tb:=t;
       writeln(querysum(ta,tb,1));
       end;
    end;
close(input);
close(output);
end.