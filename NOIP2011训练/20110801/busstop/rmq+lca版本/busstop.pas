const maxn=2020; maxx=2020000;
var tme,n,e,i,j,x,y,tot:longint;
    edge:array[1..maxn,0..maxn]of longint;
    d,res:array[1..maxn]of longint;
    a:array[1..maxx]of longint;
    f:array[1..maxx,0..30]of longint;
    two:array[0..30]of longint;
procedure dfs(x:longint);
var i:longint;
begin
inc(tme);
d[x]:=tme;
a[tme]:=x;
for i:=1 to edge[x,0] do
    begin
    if d[edge[x,i]]=0 then
       begin
       dfs(edge[x,i]);
       inc(tme);
       a[tme]:=x;
       end;
    end;
end;
function check(a,b:longint):longint;
var i,num:longint;
begin
num:=b-a+1;
for i:=0 to 20 do
    begin
    if (num>=two[i])and(num<two[i+1]) then exit(i);
    end;
end;
function min(x,y:longint):longint;
begin
if x<y then exit(x) else exit(y);
end;
procedure rmq;
var i,j,t:longint;
begin
for i:=1 to tme do f[i,0]:=a[i];
t:=check(1,tme);
for j:=1 to t do
    begin
    for i:=1 to tme+1-two[j] do
        begin
        f[i,j]:=min(f[i,j-1],f[i+two[j-1],j-1]);
        end;
    end;
end;
function fun(x,y:longint):longint;
var ta,tb,len,t:longint;
begin
ta:=d[x]; tb:=d[y];
if ta>tb then begin ta:=ta+tb; tb:=ta-tb; ta:=ta-tb; end;
len:=check(ta,tb);
t:=min(f[ta,len],f[tb+1-two[len],len]);
exit(t);
end;
begin
assign(input,'busstop.in');
reset(input);
assign(output,'busstop.out');
rewrite(output);
readln(n,e);
two[0]:=1;
for i:=1 to 30 do two[i]:=two[i-1]*2;
for i:=1 to e do
    begin
    readln(x,y);
    inc(edge[x,0]);
    edge[x,edge[x,0]]:=y;
    inc(edge[y,0]);
    edge[y,edge[y,0]]:=x;
    end;
tot:=0;
for i:=2 to n-1 do
    begin
    fillchar(d,sizeof(d),0);
    //fillchar(a,sizeof(a),0);
    //fillchar(f,sizeof(f),0);
    tme:=0;
    dfs(i);
    for j:=1 to tme do
        a[j]:=d[a[j]];
    rmq;
    //writeln(tme);
    if fun(1,n)=d[i] then
       begin
       inc(tot); res[tot]:=i;
       end;
    end;
writeln(tot);
for i:=1 to tot-1 do write(res[i],' ');
write(res[tot]);
writeln;
close(input);
close(output);
end.