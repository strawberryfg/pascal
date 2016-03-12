const maxn=1000000;
type rec=record x,h,flag:longint; end;
     re=record l,r,sum,cover:longint; end;
var a:array[0..2*maxn]of rec;
    m:array[0..4*maxn+1]of re;
    l,r,hei,p,f:array[1..2*maxn]of longint;
    fmax,n,i,tot,sum,lasth,lastx,ans:longint;
procedure sort(l,r: longint);
      var
         i,j,tmp: longint;
         tt:rec;
      begin
         i:=l;
         j:=r;
         tmp:=a[(l+r) div 2].x;
         repeat
           while a[i].x<tmp do
            inc(i);
           while tmp<a[j].x do
            dec(j);
           if not(i>j) then
             begin
                tt:=a[i];
                a[i]:=a[j];
                a[j]:=tt;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
procedure build(f,t,x:longint);
begin
m[x].l:=f; m[x].r:=t;
if f=t then exit;
build(f,(f+t)div 2,x*2);
build((f+t)div 2+1,t,x*2+1);
end;
procedure insert(f,t,delta,x:longint);
var mid:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then
   begin
   m[x].cover:=m[x].cover+delta;
   exit;
   end;
mid:=(m[x].l+m[x].r)div 2;
if (f<=mid) then insert(f,t,delta,x*2);
if (t>mid) then insert(f,t,delta,x*2+1);
if m[x*2].cover>0 then m[x].sum:=m[x*2].r-m[x*2].l+1
                  else m[x].sum:=m[x*2].sum;
if m[x*2+1].cover>0 then m[x].sum:=m[x].sum+m[x*2+1].r-m[x*2+1].l+1
                    else m[x].sum:=m[x].sum+m[x*2+1].sum;
end;
begin
assign(input,'contour.in');
reset(input);
assign(output,'contour.out');
rewrite(output);
readln(n);
fmax:=0;
for i:=1 to n do
    begin
    readln(l[i],r[i],hei[i]);
    if hei[i]>fmax then fmax:=hei[i];
    inc(tot); a[tot].x:=l[i]; a[tot].h:=hei[i]; a[tot].flag:=1;
    inc(tot); a[tot].x:=r[i]; a[tot].h:=hei[i]; a[tot].flag:=-1;
    end;
sort(1,tot);
build(1,fmax,1);
lasth:=0; lastx:=-maxlongint;    sum:=0;
for i:=1 to tot do
    begin
    insert(1,a[i].h,a[i].flag,1);
    if m[1].cover>0 then ans:=m[1].r-m[1].l+1
                    else ans:=m[1].sum;
    if ans<>lasth then
       begin
       if a[i].x=lastx then f[sum]:=ans
          else begin
               inc(sum);
               f[sum]:=ans;
               p[sum]:=a[i].x;
               end;
       lastx:=a[i].x; lasth:=ans;
       end;
    end;
for i:=1 to sum do writeln(p[i],' ',f[i]);
close(input);
close(output);
end.
