const maxn=300000;
type rec=record le,ri,hei:longint; end;
     node=record x,h:longint; end;
var a:array[1..2*maxn]of rec;
    b,f:array[0..2*maxn]of longint;
    pre,k,sum,i,tot,total,n:longint;
    heap:array[1..3*maxn]of node;
procedure sort(l,r: longint);
      var
         i,j,tmp,tmp2: longint;
         tt:rec;
      begin
         i:=l;
         j:=r;
         tmp:=a[(l+r) div 2].le;
         tmp2:=a[(l+r)div 2].ri;
         repeat
           while (a[i].le<tmp)or((a[i].le=tmp)and(a[i].ri<tmp2)) do
            inc(i);
           while (tmp<a[j].le)or((tmp=a[j].le)and(tmp2<a[j].ri)) do
            dec(j);
           if not(i>j) then
             begin
                tt:=a[i];
                a[i]:=a[j];
                a[j]:=tt;
                inc(i);
                dec(j);
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
procedure qsort(l,r: longint);
      var
         i,j,tmp,tt: longint;
      begin
         i:=l;
         j:=r;
         tmp:=b[(l+r) div 2];
         repeat
           while b[i]<tmp do
            inc(i);
           while tmp<b[j] do
            dec(j);
           if not(i>j) then
             begin
                tt:=b[i];
                b[i]:=b[j];
                b[j]:=tt;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           qsort(l,j);
         if i<r then
           qsort(i,r);
      end;
procedure pop;
var tmp:node;
    t,u,v,pnum:longint;
begin
heap[1].x:=heap[sum].x; heap[1].h:=heap[sum].h; heap[sum].x:=0; heap[sum].h:=0;
dec(sum);
t:=1;
while (t*2<=sum) do
 begin
 u:=heap[t*2].h; if t*2+1<=sum then v:=heap[t*2+1].h else v:=0;
 if u>v then pnum:=0 else pnum:=1;
 if heap[t].h<heap[t*2+pnum].h then
    begin
    tmp:=heap[t]; heap[t]:=heap[t*2+pnum]; heap[t*2+pnum]:=tmp;
    t:=t*2+pnum;
    end
 else
    break;
 end;
end;
procedure put(key,height:longint);
var t:longint;
    tmp:node;
begin
inc(sum); heap[sum].x:=key; heap[sum].h:=height;
t:=sum;
while (t>1)and(heap[t].h>heap[t div 2].h) do
  begin
  tmp:=heap[t]; heap[t]:=heap[t div 2]; heap[t div 2]:=tmp;
  t:=t div 2;
  end;
end;
begin
assign(input,'contour.in');
reset(input);
assign(output,'contour.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(a[i].le,a[i].ri,a[i].hei);
    inc(tot); b[tot]:=a[i].le; inc(tot); b[tot]:=a[i].ri;
    end;
sort(1,n);                                                              //将a[i]排序   le从小到大 le相等时ri从小到大排序
qsort(1,tot);                                                           //将b[]排序 （边界）
sum:=0;
total:=0;
b[0]:=-maxlongint;
for i:=1 to tot do
    begin
    if b[i]<>b[i-1] then begin inc(total); f[total]:=b[i]; end;         //保存不同边界值
    end;
pre:=0; k:=0;
for i:=1 to total do
    begin
    while (sum>0)and(heap[1].x<=f[i]) do pop;                           //最大高度所属矩形的右边界<=当前边界 （即不可能对当前及以后边界产生影响）
    while (a[k+1].le=f[i]) do
      begin inc(k); put(a[k].ri,a[k].hei); end;                         //将有相同左边界的矩形高度  加入堆中更新
    if heap[1].h<>pre then writeln(f[i],' ',heap[1].h);                 //输出
    pre:=heap[1].h;
    end;
close(input);
close(output);
end.