{
ID: xiaweiy1
PROG: humble
LANG: PASCAL
}
const maxn=10000000;
      maxm=999985;
      maxx=10000000;
var p:array[0..100]of longint;
    k,n,i,done,tot,num,t,res,total,ttt:longint;
    heap:array[1..maxn]of longint;
    hash:array[1..maxm]of longint;
    lian:array[1..maxx,1..2]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=p[(l+r) div 2];
         repeat
           while p[i]<x do
            inc(i);
           while x<p[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=p[i];
                p[i]:=p[j];
                p[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
function find(x:longint):boolean;
var mo,now:longint;
begin
mo:=x mod 999983;
if hash[mo]=0 then
   begin
   inc(total);
   lian[total,1]:=x div 999983;
   hash[mo]:=total;
   exit(true);
   end
else begin
     now:=hash[mo];
     if int64(lian[now,1])*int64(999983)+mo=int64(x) then
       exit(false);
     while lian[now,2]<>0 do
       begin
       now:=lian[now,2];
       if int64(lian[now,1])*int64(999983)+mo=int64(x) then
          exit(false);
       end;
     inc(total);
     if total>1200000 then
      ttt:=1;
     lian[now,2]:=total;
     lian[total,1]:=x div 999983;
     exit(true);
     end;
end;
procedure extract;
begin
heap[1]:=heap[tot]; heap[tot]:=0;
dec(tot);
end;
procedure down(x:longint);
var t1,t2,pnum,tmp,q:longint;
begin
q:=x;
while (q*2<=tot)do
 begin
 t1:=heap[q*2];
 if q*2+1<=tot then t2:=heap[q*2+1] else t2:=maxlongint;
 if t1<t2 then pnum:=0 else pnum:=1;
 if heap[q]>heap[q*2+pnum] then
    begin
    tmp:=heap[q]; heap[q]:=heap[q*2+pnum]; heap[q*2+pnum]:=tmp;
    q:=q*2+pnum;
    end
 else
    break;
 end;
end;
procedure up(x:longint);
var q,tmp:longint;
begin
q:=x;
while x div 2>=1 do
 begin
 if heap[q]<heap[q div 2] then
    begin
    tmp:=heap[q]; heap[q]:=heap[q div 2]; heap[q div 2]:=tmp;
    q:=q div 2;
    end
 else
    break;
 end;
end;
begin
assign(input,'humble.in');
reset(input);
assign(output,'humble.out');
rewrite(output);
readln(k,n);
for i:=1 to k do read(p[i]); //prime;
sort(1,k);
tot:=1; heap[1]:=1;
done:=-1;
while (tot>0)and(done<n) do
  begin
   num:=heap[1];
   res:=num;
   inc(done);
   extract;
   down(1);
  for i:=1 to k do
      begin
      if int64(num)*int64(p[i])>int64(maxlongint) then
      break;
      t:=num*p[i];
      if find(t) then
         begin
         inc(tot);
         heap[tot]:=t;
         up(tot);
         end;
      end;
  ttt:=0;

  end;
writeln(res);
//while true do ttt:=0;
close(input);
close(output);
end.
