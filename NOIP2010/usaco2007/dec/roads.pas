const maxn=1000; maxm=1500000;
type rec=array[1..3]of extended;

var n,m,i,j,a,b,tot,t1,t2:longint;
    t,ans:extended;
    f,p:int64;
    fa:array[1..maxn]of longint;
    x,y:array[1..maxn]of longint;
    edge:array[1..maxm]of rec;
function calc(st,en:longint):extended;

begin
f:=int64(x[st]-x[en])*int64(x[st]-x[en]);
p:=int64(y[st]-y[en])*int64(y[st]-y[en]);
exit(sqrt(f+p));
end;
function getfa(x:longint):longint;
begin
if fa[x]=x then exit(x);
fa[x]:=getfa(fa[x]);
exit(fa[x]);
end;
procedure sort(l,r: longint);
      var
         i,j: longint;
         x:extended;
         y:rec;
      begin
         i:=l;
         j:=r;
         x:=edge[(l+r) div 2,3];
         repeat
           while edge[i,3]<x do
            inc(i);
           while x<edge[j,3] do
            dec(j);
           if not(i>j) then
             begin
                y:=edge[i];
                edge[i]:=edge[j];
                edge[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
begin
assign(input,'roads.in');
reset(input);
assign(output,'roads.out');
rewrite(output);
readln(n,m);
for i:=1 to n do
    begin
    readln(x[i],y[i]);
    end;
for i:=1 to n do fa[i]:=i;
for i:=1 to m do
    begin
    readln(a,b);
    t1:=getfa(a); t2:=getfa(b);
    if t1<>t2 then fa[t2]:=t1;
    end;
for i:=1 to n-1 do
    for j:=i+1 to n do
        begin
           inc(tot);
           t:=calc(i,j);
           edge[tot,1]:=i; edge[tot,2]:=j; edge[tot,3]:=t;

        end;
sort(1,tot);
j:=1; ans:=0;
while (j<=tot) do
  begin
  a:=trunc(edge[j,1]); b:=trunc(edge[j,2]);
  t1:=getfa(a); t2:=getfa(b);
  if t1<>t2 then
     begin
     fa[t2]:=t1;
     ans:=ans+edge[j,3];
     end;
  inc(j);
  end;
writeln(ans:0:2);
close(input);
close(output);
end.