const maxn=1000000;
var n,m,i,k,sum,left,right,mid:longint;
    a:array[1..maxn]of longint;
function ok(t:longint):boolean;
var done,now,ans:longint;
begin
done:=0; now:=1;
ans:=0;
while (now<=n)and(done<m) do
 begin
 while (now<=n)and(ans+a[now]<=t)and(now<=(n+1)-(m-done))do
   begin
   ans:=ans+a[now];
   inc(now);
   end;
 if ans<>0 then inc(done) else exit(false);
 ans:=0;
 end;
if (done=m)and(now=n+1) then exit(true) else exit(false);
end;
begin
{assign(input,'expense.in');
reset(input);
assign(output,'expense.out');
rewrite(output);}
readln(n,m);
sum:=0;
for i:=1 to n do
    begin
    read(a[i]);
    sum:=sum+a[i];
    end;
left:=1; right:=sum;
while left<right-1 do
 begin
 mid:=(left+right)div 2;
 if ok(mid) then
    begin
    k:=mid;
    right:=mid-1;
    end
 else left:=mid+1;
 end;
if ok(left) then writeln(left) else writeln(k);
{close(input);
close(output);}
end.

