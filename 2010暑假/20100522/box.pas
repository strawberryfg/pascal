{const pi:real=3.1415926;}
var x,y,p,q,n,i,j,k,t1,t2,t,total,tt:longint;
    sum,tmp,dis,res,final:real;
    z,w,b,hash:array[1..6]of longint;
    r:array[1..6]of real;
    kind:array[1..720,1..6]of longint;
function com(a,b:longint):real;
var del1,del2:longint;
begin
del1:=z[a]-z[b];
del2:=w[a]-w[b];
com:=sqrt(del1*del1+del2*del2);
end;
function min(a,b,c,d:longint):longint;
begin
a:=abs(a); b:=abs(b); c:=abs(c); d:=abs(d);
min:=a;
if b<min then min:=b;
if c<min then min:=c;
if d<min then min:=d;
end;
procedure try(dep:longint);
var i:longint;
begin
if dep>n then
   begin
   inc(total);
   for i:=1 to n do kind[total,i]:=b[i];
   end
else
   for i:=1 to n do
       begin
       if hash[i]=0 then
          begin
          hash[i]:=1;
          b[dep]:=i;
          try(dep+1);
          hash[i]:=0;
          end;
       end;
end;
function check(num:real;now:longint):boolean;
begin
if (z[now]-num<x)or(z[now]-num>p)or(w[now]-num<y)or(w[now]-num>q) then
   exit(false)
else exit(true);
end;
begin
assign(input,'box.in');
reset(input);
assign(output,'box.out');
rewrite(output);
readln(n);
readln(x,y,p,q);
if x>p then begin tt:=x;x:=p;p:=tt; end;
if y>q then begin tt:=y;y:=q;q:=tt; end;
for i:=1 to n do
    readln(z[i],w[i]);
try(1);
final:=0;
for i:=1 to total do
    begin
    fillchar(r,sizeof(r),0);
    sum:=0;
    for j:=1 to n do
        begin
        t1:=z[kind[i,j]]; t2:=w[kind[i,j]];
         res:=min(x-t1,p-t1,y-t2,q-t2);
        for k:=1 to j-1 do
            begin
            tmp:=com(kind[i,k],kind[i,j]);
            dis:=tmp-r[k];
            if dis<0 then
               begin
               res:=0; continue;
               end;
            if check(dis,j)=true then
               begin
               if dis<res then res:=dis;
               end;
            end;
        r[j]:=res;
        sum:=sum+res*res*pi;
        end;
    if sum>final then
        begin final:=sum;
        end;
    end;
t1:=abs(x-p); t2:=abs(y-q);
t:=round(t1*t2-final);
writeln(t);
close(input);
close(output);
end.