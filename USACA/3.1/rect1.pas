{
ID: xiaweiy1
PROG: rect1
LANG: PASCAL
}
const maxn=40000;          //2 maxn
      maxc=2500;
type rec=record
     a,p,w,col,flag:longint;
     end;
     trec=record
     l,r,col:longint;
     end;
var a,b,n,i,sum,tmp,k:longint;
    sx,sy,ex,ey,paint,data,h:array[0..maxn]of longint;
    hash:array[1..maxc]of longint;
    ind:array[1..maxn+1]of rec;
    tree:array[1..maxn+1]of trec;
procedure sorth(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=h[(l+r) div 2];
         repeat
           while h[i]<x do
            inc(i);
           while x<h[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=h[i];
                h[i]:=h[j];
                h[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sorth(l,j);
         if i<r then
           sorth(i,r);
      end;
procedure sortind(l,r: longint);
      var
         i,j,x1,x2: longint;
         y:rec;
      begin
         i:=l;
         j:=r;
         x1:=ind[(l+r) div 2].a;
         x2:=ind[(l+r) div 2].flag;
         repeat
           while (ind[i].a<x1) do
            inc(i);
           while (x1<ind[j].a) do
            dec(j);
           if not(i>j) then
             begin
                y:=ind[i];
                ind[i]:=ind[j];
                ind[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sortind(l,j);
         if i<r then
           sortind(i,r);
      end;
procedure lazytag(x:longint);
begin
if tree[x].col>0 then
   begin
   tree[x*2].col:=tree[x].col;
   tree[x*2+1].col:=tree[x].col;
   tree[x].col:=-1;
   end;
end;
procedure insert(x,f,t,c:longint);
var mid:longint;
begin
if (f<=tree[x].l)and(tree[x].r<=t) then
      tree[x].col:=c
   else begin
        if tree[x].r-tree[x].l=1 then exit;
        lazytag(x);
        mid:=(tree[x].l+tree[x].r)div 2;
        if (f<mid) then insert(x*2,f,t,c);
        if (t>mid) then insert(x*2+1,f,t,c);
        end;
end;

procedure build(f,t,x:longint);
var mid:longint;
begin
tree[x].l:=f; tree[x].r:=t;
if (t-f<=1) then exit;
mid:=(f+t)div 2;
build(f,mid,x*2);
build(mid,t,x*2+1);
end;
procedure count(x,width:longint);
begin
if tree[x].col>0 then
   begin
   hash[tree[x].col]:=hash[tree[x].col]+(h[tree[x].r]-h[tree[x].l])*width;
   end
else begin
     if tree[x].r-tree[x].l>1 then
        begin
        count(x*2,width);
        count(x*2+1,width);
        end;
     end;
end;
function find(x:longint):longint;
var le,ri,mid:longint;
begin
le:=1; ri:=2*n;
while le<=ri do
   begin
   mid:=(le+ri)div 2;
   if h[mid]<x then le:=mid+1
      else if h[mid]>x then ri:=mid-1
              else begin exit(mid); end;
   end;
end;
begin
assign(input,'rect1.in');
reset(input);
assign(output,'rect1.out');
rewrite(output);
readln(a,b,n);

sx[1]:=0; sy[1]:=0; ex[1]:=a; ey[1]:=b;
paint[1]:=1;
inc(sum); h[sum]:=sy[1];
inc(sum); h[sum]:=ey[1];
for i:=1 to n do
    begin
    read(sx[i+1],sy[i+1],ex[i+1],ey[i+1],paint[i+1]);
    //dec(sy[i]); dec(ey[i]);
    inc(sum); h[sum]:=sy[i+1];
    inc(sum); h[sum]:=ey[i+1];
    end;
inc(n);
sorth(1,2*n);
for i:=1 to 2*n do
    begin
    if i mod 2=1 then data[i]:=find(sy[i div 2+1])
       else data[i]:=find(ey[i div 2]);
    end;
sum:=0;
for i:=1 to n do
    begin
    inc(sum); ind[sum].a:=sx[i]; ind[sum].p:=data[2*i-1]; ind[sum].w:=data[2*i]; {ind[sum].flag:=1;}
    ind[sum].col:=paint[i];
    inc(sum); ind[sum].a:=ex[i]; ind[sum].p:=data[2*i-1]; ind[sum].w:=data[2*i]; {ind[sum].flag:=1;}
    ind[sum].col:=paint[i];
    // .a x1 (y1 y2)
    // .a x2 (y1 y2)
    end;
sortind(1,sum);

build(0,2*n,1);
ind[sum+1].a:=ind[sum].a;

for i:=1 to sum do
    begin
//    if ind[i].flag=1 then insert(1,ind[i].p,ind[i].w,ind[i].col);

    for k:=1 to n do
        begin
        if (ind[i].a>=sx[k])and(ind[i].a<ex[k]) then
           insert(1,data[k*2-1],data[k*2],paint[k]);
        end;
    tmp:=ind[i+1].a-ind[i].a;
    count(1,tmp);
    end;
for i:=1 to 2500 do
    begin
    if hash[i]<>0 then writeln(i,' ',hash[i]);
    end;
close(input);
close(output);
end.
