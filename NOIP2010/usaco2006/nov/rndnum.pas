var a,b,two,suma,sumb:array[0..100]of longint;
    down,up,i,ans,tot,t,tn,tm,j,n,dep:longint;
    f,res:extended;
function work(num:longint):boolean;
var t,tot,t1,t2:longint;
    a:array[1..100]of longint;
begin
fillchar(a,sizeof(a),0);
t:=num;
tot:=0;     t1:=0; t2:=0;
while t>1 do
  begin
  inc(tot);
  a[tot]:=t mod 2;
  if a[tot]=0 then inc(t1) else inc(t2);
  t:=t div 2;
  end;
if t=1 then inc(t2);
if t1>=t2 then exit(true) else exit(false);
end;
function fun(num,now:longint):longint;
var m,i:longint;
    res,f:extended;
begin
if num=0 then exit(0);
m:=(dep+1)div 2-now;
if m<=0 then m:=1;
res:=1;
f:=0;
for i:=1 to m do
    begin
    res:=res*(num+1-i)/i;
    end;
f:=res;
for i:=m+1 to num do
    begin
    res:=res*(num+1-i)/i;
    f:=f+res;
    end;
exit(trunc(f));
end;
begin
assign(input,'rndnum.in');
reset(input);
assign(output,'rndnum.out');
rewrite(output);
two[0]:=1;
for i:=1 to 30 do
    begin
    two[i]:=two[i-1]*2;
    end;
readln(down,up);
t:=down; tot:=0;
while t>1 do
  begin
  inc(tot);
  a[tot]:=t mod 2;
  t:=t div 2;
  end;
if t=1 then begin inc(tot);a[tot]:=1; end;
a[0]:=tot;
t:=up; tot:=0;
while t>1 do
  begin
  inc(tot);
  b[tot]:=t mod 2;
  t:=t div 2;
  end;
if t=1 then begin inc(tot);b[tot]:=1; end;
b[0]:=tot;
for i:=a[0] downto 1 do
    suma[a[0]+1-i]:=suma[a[0]-i]+a[i];
for i:=b[0] downto 1 do
    sumb[b[0]+1-i]:=sumb[b[0]-i]+b[i];
ans:=0;
if a[0]+1<=b[0] then
begin
down:=a[0]+1; up:=b[0]-1;
if suma[a[0]]=1 then dec(down);
if sumb[b[0]]=b[0] then inc(up);
for n:=down to up do
    begin
    tm:=n-1; //fenmu
    tn:=(n+1)div 2;
    res:=1;
    for j:=1 to tn do
        begin
        res:=res*(tm+1-j)/j;
        end;
    f:=f+res;
    for j:=tn+1 to tm do

       begin
       res:=res*(tm+1-j)/j;
       f:=f+res;
       end;
    end;
ans:=trunc(f);
dep:=a[0];
if down=a[0]+1 then
begin
for i:=a[0] downto 1 do
    begin
    if a[i]=1 then continue;
    if i=1 then
       begin
       if (a[0]-i-suma[a[0]-i]>=(a[0]+1)div 2) then inc(ans);
       end
    else
    ans:=ans+fun(i-1,a[0]-i-suma[a[0]-i]);  //10010 10100
    end;
    if (a[0]-suma[a[0]]>=(a[0]+1)div 2) then inc(ans);
end;
dep:=b[0];
if up=b[0]-1 then
begin
for i:=b[0]-1 downto 1 do
    begin
    if b[i]=0 then continue;
    if i=1 then
       begin
       if (b[0]-i-sumb[b[0]-i]+1>=(b[0]+1)div 2) then inc(ans);
       end
    else
       ans:=ans+fun(i-1,b[0]-i-sumb[b[0]-i]+1); //1011010 1001101
    end;
    if (b[0]-sumb[b[0]]>=(b[0]+1)div 2) then inc(ans);
end;
end
else if (a[0]=b[0]) then
begin
dep:=a[0];
 for i:=a[0] downto 1 do
     begin
     if a[i]<b[i] then
        begin
        if i=1 then begin if (b[0]-i-sumb[b[0]-i]+1>=(b[0]+1)div 2) then inc(ans); end
          else  ans:=ans+fun(i-1,b[0]-i-sumb[b[0]-i]+1);
        end;
     end;
 if (a[0]-suma[a[0]]>=(a[0]+1)div 2) then inc(ans);
 if (b[0]-sumb[b[0]]>=(b[0]+1)div 2) then inc(ans);
{ if (a[1]=0)and(a[0]-suma[a[0]]-1>=(a[0]+1)div 2) then inc(ans);
 if (b[1]=1)and(b[0]-sumb[b[0]]+1>=(b[0]+1)div 2) then inc(ans);}
end;
writeln(ans);
close(input);
close(output);
end.
