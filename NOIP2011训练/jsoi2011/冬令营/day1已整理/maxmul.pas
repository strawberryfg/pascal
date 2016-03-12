type arr=array[-1..200]of longint;
var i,n,num,now,t,sum,tot:longint;
    pd:boolean;
    a:array[0..200]of longint;
    ans,c:arr;
    f:array[0..200]of arr;
procedure print(x:arr);
var i:longint;
begin
write(x[x[-1]]);
for i:=x[-1]-1 downto 0 do
    begin
    if x[i]>999 then write(x[i])
       else if x[i]>99 then write('0',x[i])
             else if x[i]>9 then write('00',x[i])
                   else write('000',x[i]);
    end;
end;
function mul(x,y:arr):arr;
var max,i,j,k:longint;
begin
fillchar(c,sizeof(c),0);
max:=x[-1]+y[-1];
for i:=0 to x[-1] do
    begin
    for j:=0 to y[-1] do
        begin
        k:=i+j;
        c[k]:=c[k]+x[i]*y[j];
        while c[k]>=10000 do
          begin
          c[k+1]:=c[k+1]+c[k] div 10000;
          c[k]:=c[k] mod 10000;
          if k+1>max then max:=k+1;
          end;
        end;
    end;
while c[max]>=10000 do
  begin
  c[max+1]:=c[max+1]+c[max]div 10000;
  c[max]:=c[max]mod 10000;
  inc(max);
  end;
c[-1]:=max;
exit(c);
end;
procedure pre;
var i:longint;
begin
for i:=1 to tot do
    begin
    f[i,-1]:=0;
    f[i,0]:=a[i];
    end;
end;
begin
assign(input,'maxmul.in');
reset(input);
assign(output,'maxmul.out');
rewrite(output);
readln(n);
num:=2; now:=1;
a[now]:=num;
pd:=true;
t:=n-2;
sum:=2;
while t>a[now] do
  begin
  inc(now);
  a[now]:=a[now-1]+1;
  t:=t-a[now];
  inc(sum,a[now]);
  end;
tot:=now;
  now:=tot;
  while t>0 do
    begin
    inc(a[now]);
    dec(t);
    dec(now);
    if now=0 then now:=tot;
    end;
ans[-1]:=0; ans[0]:=1;
pre;
for i:=1 to tot do
    begin
    ans:=mul(ans,f[i]);
    end;
for i:=1 to tot do
    begin
    if i<tot then write(a[i],' ') else write(a[i]);
    end;
writeln;
print(ans);
writeln;
close(input);
close(output);
end.