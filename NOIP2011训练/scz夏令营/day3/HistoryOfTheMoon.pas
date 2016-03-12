const maxx=602000;  maxm=999985;
type rec=record cover,l,r:longint; end;
var n,i,j,t,x,y,inf,sum,cnt,ta,tb,total:longint;
    code:integer;
    ss,ts:string;
    m:array[1..maxx]of rec;
    a:array[1..maxx]of longint;
    f:array[1..maxx,0..2]of longint;
    lian:array[1..maxx,1..3]of longint;
    hash:array[0..maxm]of longint;
procedure init(f,t,x:longint);
begin
m[x].l:=f; m[x].r:=t;
if f=t then exit;
init(f,(f+t)div 2,x*2);
if t=f+1 then init(t,t,x*2+1)
   else init((f+t)div 2+1,t,x*2+1);
end;
procedure insert(f,t,x:longint);
var mid:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then
   begin
   inc(m[x].cover);
   exit;
   end;
mid:=(m[x].l+m[x].r)div 2;
if (f<=mid) then insert(f,t,x*2);
if (t>mid) then insert(f,t,x*2+1);
m[x].cover:=m[x*2].cover+m[x*2+1].cover;
end;
function query(f,t,x:longint):longint;
var ans,mid:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then
   begin
   exit(m[x].cover);
   end;
ans:=0;
mid:=(m[x].l+m[x].r)div 2;
if (f<=mid) then ans:=ans+query(f,t,x*2);
if (t>mid) then ans:=ans+query(f,t,x*2+1);
exit(ans);
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
function doit(mo,x,cho:longint):longint;
var now:longint;
begin
if hash[mo]=0 then
   begin
   inc(total);
   lian[total,1]:=x div 999983;
   hash[mo]:=total;
   lian[total,3]:=cnt;
   end
else
   begin
   now:=hash[mo];
   if lian[now,1]=x div 999983 then
      begin
      exit(lian[now,3]);
      end;
   while lian[now,2]<>0 do
     begin
     now:=lian[now,2];
     if lian[now,1]=x div 999983 then
        begin
        if cho=2 then
        exit(lian[now,3]);
        end;
     end;
   inc(total);
   lian[now,2]:=total;
   lian[total,1]:=x div 999983;
   lian[total,3]:=cnt;
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
       ts:=ss;
       val(ts,x,code);
       f[i,0]:=1; f[i,1]:=x; f[i,2]:=x;
       inc(sum); a[sum]:=x;
       end
    else
       begin
       ts:=copy(ss,1,t-1);
       val(ts,x,code);
       delete(ss,1,t);
       val(ss,y,code);
       f[i,0]:=2; f[i,1]:=x; f[i,2]:=y;
       inc(sum); a[sum]:=x; inc(sum); a[sum]:=y;
       end;
    end;
sort(1,sum);
cnt:=0;
i:=1;
while i<=sum do
 begin
 j:=i;
 while (j+1<=sum)and(a[j+1]=a[i]) do
       inc(j);
 inc(cnt);
 t:=doit(a[i] mod 999983,a[i],1);
 i:=j+1;
 end;
init(1,cnt,1);
for i:=1 to n do
    begin
    if f[i,0]=1 then
       begin
       t:=doit(f[i,1] mod 999983,f[i,1],2);
       insert(t,t,1);
       end
    else
       begin
       ta:=doit(f[i,1] mod 999983,f[i,1],2);
       tb:=doit(f[i,2] mod 999983,f[i,2],2);
       writeln(query(ta,tb,1));
       end;
    end;
close(input);
close(output);
end.
