const maxn=110;
var n,tmp,res,i,j:longint;
    c:char;
    a,b:array[-1..maxn]of longint;
    f,g:array[-1..202,-1..202]of longint;
function max(x,y:longint):longint;
begin
if x>y then exit(x) else exit(y);
end;
function dp(x,y:longint):longint;
var t1,t2,i:longint;
begin
if g[x,y]<>0 then exit(g[x,y]);
if y=0 then
   begin
   g[x,0]:=0;
   for i:=1 to x do inc(f[x,0],a[i]);
   exit(g[x,0]);
   end;
t1:=0;
if (x-1>=y) then t1:=dp(x-1,y);
t2:=0;
if (x>=y-1)or(y-1=0) then t2:=dp(x,y-1)+b[x+y];
g[x,y]:=max(t1,t2);
if t1>=t2 then
   begin
   f[x,y]:=f[x-1,y]+a[x+y];
   if t1=t2 then
      begin
      if (f[x-1,y]+a[x+y]<f[x,y-1]) then
          begin
          f[x,y]:=f[x,y-1];
          end;
      end;
   end;
if t1<t2 then
   f[x,y]:=f[x,y-1];
exit(g[x,y]);
end;
function dp2(x,y:longint):longint;
var t1,t2,i:longint;
begin
if g[x,y]<>0 then exit(g[x,y]);
if y=0 then
   begin
   g[x,0]:=0;
   for i:=1 to x do inc(f[x,0],a[i]);
   exit(g[x,0]);
   end;
if x=0 then
   begin
   f[0,y]:=0;
   for i:=1 to y do inc(g[0,y],b[i]);
   exit(g[0,y]);
   end;
t1:=0;
if (x-1<=y) then t1:=dp2(x-1,y);
t2:=0;
if (x<=y-1)or((x=1)and(y<>0)) then t2:=dp2(x,y-1)+b[x+y];
g[x,y]:=max(t1,t2);
if t1>=t2 then
   begin
   f[x,y]:=f[x-1,y]+a[x+y];
   if t1=t2 then
      begin
      if (f[x-1,y]+a[x+y]<f[x,y-1]) then
          begin
          f[x,y]:=f[x,y-1];
          end;
      end;
   end;
if t1<t2 then
   f[x,y]:=f[x,y-1];
exit(g[x,y]);
end;
begin
assign(input,'shopping.in');
reset(input);
{assign(output,'shopping.out');
rewrite(output);}
readln(n);
readln(c);
for i:=1 to n do
    readln(a[i],b[i]);
for i:=1 to n-1 do
    begin
    for j:=i+1 to n do
        begin
        if (a[i]<a[j])or((a[i]=a[j])and(b[i]>b[j])) then
           begin
           tmp:=a[i]; a[i]:=a[j]; a[j]:=tmp;
           tmp:=b[i]; b[i]:=b[j]; b[j]:=tmp;
           end;
        end;
    end;
if c='T' then
   begin
   res:=dp((n+1)div 2,n-(n+1)div 2);
   writeln(f[(n+1)div 2,n-(n+1)div 2],' ',g[(n+1)div 2,n-(n+1)div 2]);
   end
else
   begin
   res:=dp2(n div 2,n-n div 2);
   writeln(f[n div 2,n-n div 2],' ',g[n div 2,n-n div 2]);
   end;
close(input);
close(output);
end.
