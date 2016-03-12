type rec=record
     l,r,sum:longint;
     end;
var n,q,i,a,b,delta,t:longint;
    m:array[1..1000000]of rec;
    lazy,v:array[1..1000000]of longint;
function find(f,t,x:longint):longint;
var ta,tb:longint;
begin
ta:=0; tb:=0;
if lazy[x]<>0 then
   begin
   m[x*2].sum:=m[x*2].sum+lazy[x]*(m[x*2].r-m[x*2].l+1);
   m[x*2+1].sum:=m[x*2+1].sum+lazy[x]*(m[x*2+1].r-m[x*2+1].l+1);
   lazy[x*2]:=lazy[x*2]+lazy[x];
   lazy[x*2+1]:=lazy[x*2+1]+lazy[x];
   lazy[x]:=0;
   end;
if (f<=m[x].l)and(t>=m[x].r) then
    begin
    lazy[x]:=delta;
    m[x].sum:=m[x].sum+delta*(m[x].r-m[x].l+1);
    exit(m[x].sum);
    end
else begin
     if (f<=m[x*2].r) then
        ta:=find(f,t,x*2);
     if (t>=m[x*2+1].l) then
        tb:=find(f,t,x*2+1);
     m[x].sum:=m[x*2].sum+m[x*2+1].sum;
     exit(ta+tb);
     end;
end;
procedure init(f,t,x:longint);
begin
m[x].l:=f; m[x].r:=t;
if f=t then
   begin
   m[x].sum:=v[f];
   end
else begin
     init(f,(f+t)div 2,x*2);
     init((f+t)div 2+1,t,x*2+1);
     m[x].sum:=m[x*2].sum+m[x*2+1].sum;
     end;
end;
begin
assign(input,'modify.in');
reset(input);
assign(output,'e:\modify.out');
rewrite(output);
readln(n,q);
for i:=1 to n do
    begin
    read(v[i]);
    end;
init(1,n,1);
for i:=1 to q do
    begin
    readln(a,b,delta);
    t:=find(a,b,1);
    write(t,' ');
    end;
writeln;
close(input);
close(output);
end.