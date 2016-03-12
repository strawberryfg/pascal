{
ID: xiaweiy1
PROG: agrinet
LANG: PASCAL
}
type rec=array[1..3]of longint;
const  maxn=200;
var now,tot,done,ans,i,j,n,a,b,ta,tb:longint;
    edge:array[1..maxn*maxn]of rec;
    g:array[1..maxn,1..maxn]of longint;
    fa:array[1..maxn]of longint;
function getf(x:longint):longint;
begin
if fa[x]=x then exit(x)
   else begin
        fa[x]:=getf(fa[x]);
        exit(fa[x]);
        end;
end;
procedure sort(l,r: longint);
      var
         i,j,x: longint;
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
assign(input,'agrinet.in');
reset(input);
assign(output,'agrinet.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    fa[i]:=i;
    for j:=1 to n do
        begin
        read(g[i,j]);

        if g[i,j]<>0 then
           begin
           inc(tot);
           edge[tot,1]:=i;
           edge[tot,2]:=j;
           edge[tot,3]:=g[i,j];
           end;
        end;
    readln;
    end;
sort(1,tot);
now:=1; done:=1;
ans:=0;
while (now<=tot)and(done<=n-1)do
 begin
 a:=edge[now,1]; b:=edge[now,2];
 ta:=getf(fa[a]); tb:=getf(fa[b]);
 if ta<>tb then
    begin
    fa[tb]:=ta;
    inc(done);
    inc(ans,g[a,b]);
    end;
 inc(now);
 end;
writeln(ans);
close(input);
close(output);
end.
