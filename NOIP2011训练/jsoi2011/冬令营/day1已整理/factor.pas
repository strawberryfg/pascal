type arr=array[-1..100]of longint;
var f,g,r,res:arr;
    n,m,i,t:longint;
    ans:array[0..1000,1..2]of longint;
function check(x:arr):boolean;
var i:longint;
begin
for i:=0 to x[-1] do if x[i]<>0 then exit(false);
exit(true);
end;
function handle(t,p,num:longint):boolean;
var a,b,ta,tb,t1,t2,r,tmp:longint;
    mark:boolean;
begin
a:=p;
b:=t;
if (a<0) then
    begin
    a:=-a;
    t1:=1;
    end
else t1:=0;
if (b<0) then
   begin
   b:=-b;
   t2:=1;
   end
else t2:=0;
if t1 xor t2=1 then mark:=true else mark:=false; //youwu fuhao: -ans
ta:=a; tb:=b;
if a<b then begin tmp:=a; a:=b; b:=tmp; end;
r:=a mod b;
while r<>0 do
  begin
  a:=b;
  b:=r;
  r:=a mod b;
  end;
ans[num,1]:=ta div b; ans[num,2]:=tb div b;
exit(mark);
end;
procedure print(x:arr);
var i,t:longint;
begin

writeln(x[-1]);
if x[x[-1]]<0 then
   begin
   for i:=0 to x[-1] do x[i]:=-x[i];
   end;
t:=x[x[-1]];
for i:=0 to x[-1] do
    begin
    if x[i]=0 then
       begin
       writeln(0); continue;
       end;
    if handle(t,x[i],i) then write('-'); //you fu hao
         write(ans[i,1],'/',ans[i,2]);
         writeln;
    end;
end;
function calc(x,y:arr):arr;
var k,t,i,now:longint;
begin
if x[-1]<y[-1] then exit(x);
k:=x[-1]-y[-1];
fillchar(res,sizeof(res),0);
t:=x[x[-1]]div y[y[-1]];
for i:=y[-1] downto 0 do
    begin
    res[i+k]:=x[i+k]-t*y[i];
    end;
for i:=k-1 downto 0 do
    begin
    res[i]:=x[i];
    end;
now:=x[-1];
while (res[now]=0)and(now-1>=0) do dec(now);
res[-1]:=now;
exit(res);
end;
begin
assign(input,'factor.in');
reset(input);
assign(output,'factor.out');
rewrite(output);
readln(n);
for i:=0 to n do
    begin
    readln(t);
    f[i]:=t;
    end;
f[-1]:=n;
readln(m);
for i:=0 to m do
    begin
    readln(t);
    g[i]:=t;
    end;
g[-1]:=m;
//tf:=f; tg:=g;
r:=calc(f,g);
while not check(r) do    //check(r)=true r=0 else r!=0 end if ; end sub;
  begin
  f:=g;
  g:=r;
  r:=calc(f,g);
  end;
print(g);
close(input);
close(output);
end.
