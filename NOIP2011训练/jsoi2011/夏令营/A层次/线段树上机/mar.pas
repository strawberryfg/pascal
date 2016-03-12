const maxn=120000;
type rec=array[0..3]of longint;
     re=record
     l,r,sum,cover:longint;
     end;
var m:array[1..maxn]of re;
    a:array[1..maxn]of rec;
    n,x1,y1,x2,y2,top,fmax,i,ans:longint;
procedure init(f,t,x:longint);
begin
m[x].l:=f;
m[x].r:=t;
if f=t then
   begin
   m[x].sum:=0; m[x].cover:=0;
   exit;
   end;
init(f,(f+t)div 2,x*2);
init((f+t)div 2+1,t,x*2+1);
end;
procedure insert(f,t,x,delta:longint);
var mid:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then
   begin
   m[x].cover:=m[x].cover+delta;
   exit;
   end;
mid:=(m[x].l+m[x].r)div 2;
if (f<=mid) then insert(f,t,x*2,delta);
if (t>mid) then insert(f,t,x*2+1,delta);
if m[x*2].cover>0 then m[x].sum:=m[x*2].r-m[x*2].l+1
                  else m[x].sum:=m[x*2].sum;
if m[x*2+1].cover>0 then m[x].sum:=m[x].sum+m[x*2+1].r-m[x*2+1].l+1
                    else m[x].sum:=m[x].sum+m[x*2+1].sum;

end;
procedure sort(l,r: longint);
      var
         i,j,x: longint;
         y:rec;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2,1];
         repeat
           while a[i,1]<x do
            inc(i);
           while x<a[j,1] do
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
begin
{assign(input,'mar.in');
reset(input);}
readln(n);
for i:=1 to n do
    begin
    readln(x1,y1,x2,y2);
    inc(y1);  if y2>fmax then fmax:=y2;
    inc(top); a[top,0]:=1; a[top,1]:=x1; a[top,2]:=y1; a[top,3]:=y2;
    inc(top); a[top,0]:=-1; a[top,1]:=x2; a[top,2]:=y1; a[top,3]:=y2;
    end;
sort(1,top);
init(1,fmax,1);
insert(a[1,2],a[1,3],1,a[1,0]);
ans:=0;
for i:=2 to top do
    begin
    if m[1].cover>0 then ans:=ans+(m[1].r-m[1].l+1)*(a[i,1]-a[i-1,1])
                    else ans:=ans+m[1].sum*(a[i,1]-a[i-1,1]);
    insert(a[i,2],a[i,3],1,a[i,0]);
    end;
writeln(ans);
//close(input);
end.
