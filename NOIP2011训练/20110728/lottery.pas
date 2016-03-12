type arr=array[-1..10000]of longint;
var st:string;
    m,i,tmp,len:longint;
    a,res,b,c:arr;
function mul(x,y:arr):arr;
var i,j,k,max:longint;
begin
max:=x[-1]+y[-1];
fillchar(c,sizeof(c),0);
for i:=0 to x[-1] do
    begin
    for j:=0 to y[-1] do
        begin
        c[i+j]:=c[i+j]+x[i]*y[j];
        c[i+j+1]:=c[i+j+1]+c[i+j]div 10000;
        c[i+j]:=c[i+j] mod 10000;
        k:=i+j+1;
        while c[k]>10000 do
          begin
          if k>max then max:=k;
          c[k+1]:=c[k+1]+c[k] div 10000;
          c[k]:=c[k] mod 10000;
          inc(k);
          end;
        end;
    end;
while c[k]>10000 do
 begin
 if k>max then max:=k;
 c[k+1]:=c[k+1]+c[k] div 10000;
 c[k]:=c[k] mod 10000;
 inc(k);
 end;
if c[k]<>0 then max:=k;
c[-1]:=max;
exit(c);
end;
function gcd(x,y:arr):arr;
var t,tmp,i:longint;
begin
t:=0;   tmp:=-1;
fillchar(c,sizeof(c),0);
for i:=x[-1] downto 0 do
    begin
    t:=t*10000+x[i];
    if t div y[0]>=1 then
       begin
       if tmp=-1 then tmp:=i;
       c[i]:=t div y[0];
       t:=t mod y[0];
       end;
    end;
c[-1]:=tmp;
exit(c);
end;
function solve(x:arr):arr;
var i:longint;
begin
if x[-1]=0 then x[0]:=x[0]-1
   else begin
        i:=0;
        x[0]:=x[0]-1;
        while (x[i]<0)and(i<=x[-1]) do
         begin
         x[i]:=10000+x[i];
         x[i+1]:=x[i+1]-1;
         inc(i);
         end;
        if x[x[-1]]=0 then x[-1]:=x[-1]-1;
        end;
exit(x);
end;
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
begin
assign(input,'lottery.in');
reset(input);
assign(output,'lottery.out');
rewrite(output);
readln(st);
readln(m);
len:=length(st);    //array 0
for i:=0 to len-1 do
    begin
    tmp:=(len-i-1)div 4;
    a[tmp]:=a[tmp]*10+ord(st[i+1])-ord('0');
    end;
a[-1]:=(len-1)div 4;
res[0]:=1;
for i:=1 to m do
    begin
    b[0]:=i;
    res:=mul(res,a);
    res:=gcd(res,b);
    a:=solve(a);
    end;
print(res);
close(input);
close(output);
end.