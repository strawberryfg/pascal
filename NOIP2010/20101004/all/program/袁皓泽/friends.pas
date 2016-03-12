var s:string;
a,b:array[1..1000]of longint;
c,d:array[-1..10]of longint;
n,i,j,k,l:longint;
pd,ppp:boolean;
procedure pf;
var i:longint;
pp:boolean;
begin
pp:=true;
for i:=-1 to 10 do
begin
if (c[i]>0)and(d[i]=0)then pp:=false;
if (c[i]=0)and(d[i]>0)then pp:=false;
end;
pd:=pp;
if pd=true then ppp:=pd;
end;
procedure ff2(x:longint);
begin
if x=1 then begin
if b[x]<>1 then begin
dec(d[b[x]]);
inc(d[b[x]-1]);
inc(d[b[x+1]+1]);
dec(d[b[x+1]]);
pf;
inc(d[b[x]]);
dec(d[b[x]-1]);
dec(d[b[x+1]+1]);
inc(d[b[x+1]]);
end;
dec(d[b[x]]);
inc(d[b[x]+1]);
inc(d[b[x+1]-1]);
dec(d[b[x+1]]);
pf;
inc(d[b[x]]);
dec(d[b[x]+1]);
dec(d[b[x+1]-1]);
inc(d[b[x+1]]);
end else begin
dec(d[b[x]]);
inc(d[b[x]-1]);
inc(d[b[x+1]+1]);
dec(d[b[x+1]]);
pf;
inc(d[b[x]]);
dec(d[b[x]-1]);
dec(d[b[x+1]+1]);
inc(d[b[x+1]]);
dec(d[b[x]]);
inc(d[b[x]+1]);
inc(d[b[x+1]-1]);
dec(d[b[x+1]]);
pf;
inc(d[b[x]]);
dec(d[b[x]+1]);
dec(d[b[x+1]-1]);
inc(d[b[x+1]]);
end;
end;
procedure ff1(x:longint);
begin
if x=1 then begin
if a[x]<>1 then begin
dec(c[a[x]]);
inc(c[a[x]-1]);
inc(c[a[x+1]+1]);
dec(c[a[x+1]]);
pf;
inc(c[a[x]]);
dec(c[a[x]-1]);
dec(c[a[x+1]+1]);
inc(c[a[x+1]]);
end;
dec(c[a[x]]);
inc(c[a[x]+1]);
inc(c[a[x+1]-1]);
dec(c[a[x+1]]);
pf;
inc(c[a[x]]);
dec(c[a[x]+1]);
dec(c[a[x+1]-1]);
inc(c[a[x+1]]);
end else begin
dec(c[a[x]]);
inc(c[a[x]-1]);
inc(c[a[x+1]+1]);
dec(c[a[x+1]]);
pf;
inc(c[a[x]]);
dec(c[a[x]-1]);
dec(c[a[x+1]+1]);
inc(c[a[x+1]]);
dec(c[a[x]]);
inc(c[a[x]+1]);
inc(c[a[x+1]-1]);
dec(c[a[x+1]]);
pf;
inc(c[a[x]]);
dec(c[a[x]+1]);
dec(c[a[x+1]-1]);
inc(c[a[x+1]]);
end;
end;
begin
assign(input,'friends.in');
assign(output,'friends.out');
reset(input);
rewrite(output);
readln(n);
for i:=1 to n do
begin
pd:=false;
ppp:=false;
for j:=-1 to 10 do
begin
c[j]:=0;
d[j]:=0;
end;
readln(s);
j:=1;
while s[j]<>' ' do
begin
a[j]:=ord(s[j])-ord('0');
inc(c[a[j]]);
inc(j);
end;
k:=length(s);
for l:=j+1 to k do
begin
b[l-j]:=ord(s[l])-ord('0');
inc(d[b[l-j]]);
end;
dec(j);
l:=k-j-1;
pd:=false;
pf;
if pd=true then writeln('friends') else
begin
for k:=1 to j-1 do
ff1(k);
for k:=1 to l-1 do
ff2(k);
if ppp=true then writeln('almost friends') else writeln('nothing');
end
end;
close(input);
close(output);
end.
