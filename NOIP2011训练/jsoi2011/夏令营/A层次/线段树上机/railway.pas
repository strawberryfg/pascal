const maxn=200200;
type rec=record
         max,delta,l,r:longint;
         end;
var m:array[1..maxn]of rec;
    c,s,r,o,d,n,i:longint;
function fmax(x,y:longint):longint;
begin
if x>y then exit(x) else exit(y);
end;
procedure update(f,t,x,del:longint);
var mid:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then
   begin
   m[x].delta:=m[x].delta+del;
   m[x].max:=m[x].max+del;
   exit;
   end;
mid:=(m[x].l+m[x].r)div 2;
if (f<=mid) then update(f,t,x*2,del);
if (t>mid) then update(f,t,x*2+1,del);
if m[x*2].max>m[x*2+1].max then m[x].max:=m[x*2].max
                           else m[x].max:=m[x*2+1].max;
end;
function findmax(f,t,x:longint):longint;
var ans,mid:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then
   begin
   exit(m[x].max);
   end;
m[x*2].delta:=m[x*2].delta+m[x].delta;
m[x*2].max:=m[x*2].max+m[x].delta;
m[x*2+1].delta:=m[x*2+1].delta+m[x].delta;
m[x*2+1].max:=m[x*2+1].max+m[x].delta;
m[x].delta:=0;
mid:=(m[x].l+m[x].r)div 2;
ans:=0;
if f<=mid then ans:=findmax(f,t,x*2);
if t>mid then ans:=fmax(ans,findmax(f,t,x*2+1));
exit(ans);
end;
procedure init(f,t,x:longint);
begin
m[x].l:=f; m[x].r:=t;
if f=t then
   begin
   m[x].delta:=0; m[x].max:=0;
   exit;
   end;
init(f,(f+t)div 2,x*2);
init((f+t)div 2+1,t,x*2+1);
end;
begin
{assign(input,'railway.in');
reset(input);}
readln(c,s,r);
init(1,c,1);
for i:=1 to r do
    begin
    readln(o,d,n);
    if findmax(o,d-1,1)+n>s then writeln('NO')
                            else begin
                                 update(o,d-1,1,n);
                                 writeln('YES');
                                 end;
    end;
//close(input);
end.