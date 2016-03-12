type rec=record
     l,r,sum:longint;
     end;
var n,q,t,i,a,b:longint;
    m:array[1..100]of rec;
    v:array[1..100]of longint;
procedure insert(f,t,x:longint);
begin
m[x].l:=f; m[x].r:=t;
if (f=t)then
    begin
    m[x].sum:=v[f];
    end
else begin
     insert(f,(f+t)div 2,x*2);
     insert((f+t)div 2+1,t,x*2+1);
     m[x].sum:=m[x*2].sum+m[x*2+1].sum;
     end;
end;
function add(f,t,x:longint):longint;
var ans:longint;
begin
if (f<=m[x].l)and(t>=m[x].r) then
    exit(m[x].sum)
else begin
     ans:=0;
     if (f<=m[x*2].r) then
        ans:=ans+add(f,t,x*2);
     if (t>=m[x*2+1].l) then
        ans:=ans+add(f,t,x*2+1);
     exit(ans);
     end;
end;
begin
assign(input,'modify.in');
reset(input);
readln(n,q);
for i:=1 to n do
    begin
    read(t);
    v[i]:=t;
    end;
insert(1,n,1);
for i:=1 to q do
    begin
    readln(a,b);
    writeln(add(a,b,1));
    end;
close(input);
end.