const maxn=120;
var n,i,j,tmp,t:longint;
    c:char;
    a,b:array[0..maxn]of longint;
    f,g:array[0..maxn,0..maxn]of longint;
function max(x,y:longint):longint;
begin
if x>y then exit(x) else exit(y);
end;
function dp(x,y:longint):longint;
var sum,t1,t2:longint;
begin
if (g[x,y]<>0) then exit(g[x,y]);
if (y=0) then
   begin
   sum:=0;
   for i:=1 to x do inc(sum,a[i]);
   g[x,y]:=0;
   f[x,y]:=sum;
   exit(g[x,y]);
   end;
t1:=0;
if (y-1>=0) then t1:=dp(x,y-1)+b[x+y];
t2:=0;
if (x-1>=y)and(x-1<>0) then t2:=dp(x-1,y);
g[x,y]:=max(t1,t2);
if t1>t2 then f[x,y]:=f[x,y-1]
   else if t1<t2 then f[x,y]:=f[x-1,y]+a[x+y]
           else begin
                f[x,y]:=max(f[x,y-1],f[x-1,y]+a[x+y]);
                end;
exit(g[x,y]);
end;
begin
assign(input,'shopping.in');
reset(input);
assign(output,'shopping.out');
rewrite(output);
readln(n);
readln(c);
for i:=1 to n do begin readln(a[i],b[i]); end;
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
if c='L' then
   begin
   inc(n);
   for i:=n downto 2 do
       begin
       a[i]:=a[i-1]; b[i]:=b[i-1];
       end;
   a[1]:=0; b[1]:=0;
   end;
t:=dp(n-n div 2,n div 2);
writeln(f[n-n div 2,n div 2],' ',t);
close(input);
close(output);
end.