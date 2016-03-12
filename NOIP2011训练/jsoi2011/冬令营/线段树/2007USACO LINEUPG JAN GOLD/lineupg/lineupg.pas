type rec=record
     l,r,min,max:longint;
     end;
var m:array[1..1000000]of rec;
    i:longint;

    ta,tb,n,q,left,right:longint;
    a:array[1..1000000]of longint;
function max(x,y:longint):longint;
begin
if x>y then exit(x) else exit(y);
end;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
procedure init(f,t,x:longint);
begin
m[x].l:=f;
m[x].r:=t;
if (f=t) then
    begin
    m[x].max:=a[f];
    m[x].min:=a[f];
    end
else
    begin
    init(f,(f+t) div 2,x*2);
    init((f+t)div 2+1,t,x*2+1);
    m[x].max:=max(m[x*2].max,m[x*2+1].max);
    m[x].min:=min(m[x*2].min,m[x*2+1].min);
    end
end;
function findmin(f,t,now:longint):longint;
var p,mid:longint;
begin
mid:=(m[now].l+m[now].r)div 2;
p:=maxlongint;
if (f<=m[now].l)and(t>=m[now].r) then
    exit(m[now].min);
if (f<=m[now*2].r) then
   p:=findmin(f,t,now*2);
if (t>=m[now*2+1].l) then
   p:=min(p,findmin(f,t,now*2+1));
exit(p);
end;
function findmax(f,t,now:longint):longint;
var p,mid:longint;
begin
mid:=(m[now].l+m[now].r)div 2;
p:=0;
if (f<=m[now].l)and(t>=m[now].r) then
    exit(m[now].max);
if (f<=m[now*2].r) then
   p:=findmax(f,t,now*2);
if (t>=m[now*2+1].l) then
   p:=max(p,findmax(f,t,now*2+1));
exit(p);
end;
begin
assign(input,'lineupg.in');
reset(input);
assign(output,'lineupg.out');
rewrite(output);
readln(n,q);
for i:=1 to n do
    begin
    readln(a[i]);
    end;
init(1,n,1);
for i:=1 to q do
    begin
    readln(left,right);
    ta:=findmin(left,right,1);
    tb:=findmax(left,right,1);
    writeln(tb-ta);
    end;
close(input);
close(output);
end.
