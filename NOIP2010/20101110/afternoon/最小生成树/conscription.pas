const maxn=220000;
      maxm=420000;
      //E= n+m+r;
      //V= n+m;
type rec=record u,v,length:longint;end;
var n,m,r,x,y,w,i,j,ans,tot,a,b:longint;
    edge:array[1..maxm]of rec;
    fa:array[0..maxn]of longint;
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
         tmp:rec;
      begin
         i:=l;
         j:=r;
         x:=edge[(l+r) div 2].length;
         repeat
           while edge[i].length<x do
            inc(i);
           while x<edge[j].length do
            dec(j);
           if not(i>j) then
             begin
                tmp:=edge[i];
                edge[i]:=edge[j];
                edge[j]:=tmp;
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
assign(input,'conscription.in');
reset(input);
assign(output,'conscription.out');
rewrite(output);
readln(n,m,r);
for i:=1 to n+m do
    begin
    inc(tot);
    edge[tot].u:=0;
    edge[tot].v:=i;
    edge[tot].length:=10000;
    end;
for i:=1 to r do
    begin
    readln(x,y,w);
    inc(tot);
    edge[tot].u:=x+1;
    edge[tot].v:=y+n+1;
    edge[tot].length:=10000-w;
    end;
sort(1,tot);
for i:=1 to n+m do fa[i]:=i;
i:=1; j:=0;  ans:=0;
while (i<=tot)and(j<n+m) do
  begin
  a:=getf(edge[i].u); b:=getf(edge[i].v);
  if a<>b then
     begin
     ans:=ans+edge[i].length;
     fa[b]:=a;
     inc(j);
     end;
  inc(i);
  end;
writeln(ans);
close(input);
close(output);
end.