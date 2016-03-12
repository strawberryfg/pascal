var n,m,a,b,t,i,j,res,ti,tj,num,fmax,minnum,sum,t1,t2:longint;
    td,d,deep,pos,hash:array[1..1000000]of longint;
    two:array[0..32]of longint;
    edge,f:array[0..7002,0..2002]of integer;
function check(a,b:longint):longint;
var i,num:longint;
begin
num:=b-a+1;
for i:=0 to 20 do
    begin
    if (num>=two[i])and(num<two[i+1]) then exit(i);
    end;
end;
function min(a,b:longint):longint;
begin
if a<b then exit(a) else exit(b);
end;
procedure work;

var i,t,j:longint;
begin
for i:=1 to sum do f[i,0]:=d[i];
t:=check(1,sum);
for j:=1 to t do
    begin
    for i:=1 to sum+1-j do
        begin
        f[i,j]:=min(f[i,j-1],f[i+two[j-1],j-1]);
        end;
    end;
end;
function fun(x,y:longint):longint;
var a,b,t,len,tmp:longint;
begin
a:=pos[x]; b:=pos[y];
if a>b then
   begin
   tmp:=a; a:=b; b:=tmp;
   end;
len:=check(a,b);
t:=min(f[a,len],f[b-two[len]+1,len]);
exit(t);
end;
procedure dfs(dep,now:longint);
var i,p:longint;
begin
inc(sum);
d[sum]:=dep;
deep[dep]:=now;
if hash[dep]=0 then
   begin
   hash[dep]:=1;
   pos[dep]:=sum;
   end;
if edge[dep,0]=0 then exit;
for i:=1 to edge[dep,0] do
   begin
   p:=edge[dep,i];
   if hash[p]=1 then continue;

   dfs(edge[dep,i],now+1);
   inc(sum);
   d[sum]:=dep;
   end;
end;
begin
assign(input,'road.in');
reset(input);
assign(output,'road.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
    begin
    readln(a,b);
    if a>b then
       begin
       t:=a;
       a:=b;
       b:=t;
       end;
    inc(edge[a,0]);
    edge[a,edge[a,0]]:=b;
    inc(edge[b,0]);
    edge[b,edge[b,0]]:=a;
    end;
pos[1]:=1;
hash[1]:=1;
dfs(1,0);
two[0]:=1;
for i:=1 to 30 do two[i]:=two[i-1]*2;
td:=d;
for i:=1 to sum do d[i]:=pos[d[i]];
work;
fmax:=0; minnum:=maxlongint;
for i:=1 to n do
    begin
    res:=0;
    for j:=1 to n do
        begin
        if i=j then continue;
        ti:=i; tj:=j;
        num:=fun(ti,tj);
        if num=1 then
           begin
           inc(res,deep[ti]+deep[tj]);
           end
        else if num=pos[ti] then //ti zishu tj
                begin
                inc(res,deep[tj]-deep[ti]);
                end
             else if num=pos[tj] then
                    begin
                    inc(res,deep[ti]-deep[tj]);
                    end
                  else begin
                       t1:=deep[ti]-deep[td[num]];
                       t2:=deep[tj]-deep[td[num]];
                       inc(res,t1+t2);
                       end;
        end;
    if res>fmax then
        begin
        fmax:=res; minnum:=i;
        end
       else if res=fmax then
               begin
               minnum:=min(minnum,i);
               end;
    end;
writeln(minnum);
close(input);
close(output);
end.
