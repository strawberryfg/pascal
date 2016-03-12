var i,j,n,cnt,ans:longint;
    link,a:array[1..100,0..100]of longint;
    hash:array[1..100]of boolean;
function gcd(a,b:longint):longint;
var r,tmp:longint;
begin
if a=maxlongint then exit(b);
if a<b then begin tmp:=a;a:=b;b:=tmp; end;
r:=a mod b;
while (r<>0) do
 begin
 a:=b;
 b:=r;
 r:=a mod b;
 end;
exit(b);
end;
function gbs(a,b:longint):longint;
var t:longint;
begin
if b=1 then exit(a);
t:=gcd(a,b);
exit((a*b)div t);
end;
procedure work(now,x:longint);
var tx,i:longint;
begin
if now=2 then
   begin
   ans:=gbs(x,ans);
   exit;
   end;
for i:=1 to link[now,0] do
    begin
    if hash[link[now,i]]=false then
       begin
       hash[link[now,i]]:=true;
       tx:=x;
       x:=gcd(x,a[now,link[now,i]]);
       if ans mod x<>0 then work(link[now,i],x);
       hash[link[now,i]]:=false;
       x:=tx;
       end;
    end;
end;
begin
assign(input,'cowmath.in');
reset(input);
assign(output,'cowmath.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    for j:=1 to n do
        begin
        read(a[i,j]);
        if a[i,j]<>0 then
           begin
           cnt:=link[i,0]+1;
           link[i,cnt]:=j;
           link[i,0]:=cnt;
           end;
        end;
    readln;
    end;
ans:=1;
work(1,maxlongint);
writeln(ans);
close(input);
close(output);
end.