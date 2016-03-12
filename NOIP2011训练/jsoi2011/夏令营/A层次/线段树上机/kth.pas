const maxl=20; maxn=10; maxt=100;
type seg=record
      l,r,min,max:longint;
      end;
var n,kinds,i,j,u,v,w,ans,le,ri,mid,knum,tmp:longint;
    tree:array[1..maxl,1..maxn]of longint;
    m:array[1..maxt]of seg;
    a:array[1..maxn]of longint;
    flag:boolean;
function fmin(x,y:longint):longint;
 begin
 if x<y then exit(x) else exit(y);
 end;
function fmax(x,y:longint):longint;
 begin
 if x>y then exit(x) else exit(y);
 end;
procedure build(f,t,x,s:longint);
var mid,p,q,tot:longint;
begin
m[x].l:=f; m[x].r:=t;
if f=t then
   begin
   tree[s,f]:=a[f];
   exit;
   end;
mid:=(f+t)div 2;
build(f,mid,x*2,s+1);
build(mid+1,t,x*2+1,s+1);
p:=f; q:=mid+1;
tot:=0;
while (p<=mid)and(q<=t) do
  begin
  if tree[s+1,p]<=tree[s+1,q] then
     begin
     while (p<=mid)and(tree[s+1,p]<=tree[s+1,q]) do
           begin
           inc(tot);
           tree[s,f+tot-1]:=tree[s+1,p];
           inc(p);
           end;
     inc(tot); tree[s,f+tot-1]:=tree[s+1,q];
     inc(q);
     end
  else begin
       while (q<=t)and(tree[s+1,p]>tree[s+1,q])do
           begin
           inc(tot);
           tree[s,f+tot-1]:=tree[s+1,q];
           inc(q);
           end;
       inc(tot); tree[s,f+tot-1]:=tree[s+1,p];
       inc(p);
       end;
  end;
while (p<=mid) do
  begin
  inc(tot); tree[s,f+tot-1]:=tree[s+1,p]; inc(p);
  end;
while (q<=t) do
  begin
  inc(tot); tree[s,f+tot-1]:=tree[s+1,q]; inc(q);
  end;
end;
function getnum(f,t,x,k:longint):longint;
var le,ri,mid,knum,ans,t1,t2:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then
   begin
   le:=m[x].l; ri:=m[x].r; knum:=0;
   if (le=ri) then
      begin
      if a[le]<k then exit(1)
                 else begin
                      if a[le]=k then begin flag:=true; end;
                      exit(0);
                      end;
      end;
   while (le<ri-1) do
    begin
    if le=ri-1 then begin t1:=le;t2:=ri; end;
    mid:=(le+ri)div 2;
    if a[mid]<k then le:=mid+1
       else if a[mid]=k then begin flag:=true; knum:=mid-m[x].l+1; break; end
               else ri:=mid-1;
    end;
   if knum<>0 then exit(knum-1);
   if a[ri]<k then exit(ri-m[x].l+1)
      else if a[ri]=k then begin flag:=true; exit(ri-m[x].l) end
              else if a[le]<k then exit(le-m[x].l+1)
                      else if a[le]=k then begin flag:=true; exit(le-m[x].l); end;
   end;
ans:=0;
mid:=(m[x].l+m[x].r)div 2;
if f<=mid then ans:=ans+getnum(f,t,x*2,k);
if t>mid then ans:=ans+getnum(f,t,x*2+1,k);
exit(ans);
end;
begin
assign(input,'kth.in');
reset(input);
readln(n,kinds);
for i:=1 to n do
    begin
    read(a[i]);
    if a[i]>tmp then tmp:=a[i];
    end;
build(1,n,1,1);
for i:=1 to maxl do
    begin
    for j:=1 to maxn do
        begin
        write(tree[i,j],'    ');
        end;
    writeln;
    end;
for i:=1 to kinds do
    begin
    readln(u,v,w);
    le:=1; ri:=n; knum:=0;
    flag:=false;
    while le<ri-1 do
     begin
     mid:=(le+ri)div 2;
     ans:=getnum(u,v,1,tree[1,mid]);
     if ans+1=w then begin if flag then knum:=mid; le:=mid+1; end
        else if ans+1<w then le:=mid+1
                else ri:=mid-1;
     end;
    if knum<>0 then writeln(knum)
       else begin
            if getnum(u,v,1,ri)+1=w then writeln(ri) else writeln(le);
            end;
    end;

close(input);
end.
