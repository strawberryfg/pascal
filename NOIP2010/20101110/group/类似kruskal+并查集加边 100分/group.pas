const maxm=20000; maxn=10200;
type rec=record u,v,len:longint; end;
var edge:array[1..maxm]of rec;
    n,m,p,q,i,j,a,b,c,tot,le,ri,mid,x,y,knum:longint;
    ans:int64;
    fa:array[1..maxn]of longint;
procedure sort(l,r: longint);
      var
         i,j,x: longint;
         tmp:rec;
      begin
         i:=l;
         j:=r;
         x:=edge[(l+r) div 2].len;
         repeat
           while edge[i].len<x do
            inc(i);
           while x<edge[j].len do
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
function getf(num:longint):longint;
begin
if fa[num]=num then exit(num)
   else begin
        fa[num]:=getf(fa[num]);
        exit(fa[num]);
        end;
end;
begin
assign(input,'group.in');
reset(input);
assign(output,'group.out');
rewrite(output);
readln(n,m,q,p);
for i:=1 to m do
    begin
    readln(a,b,c);
    inc(tot);
    edge[tot].u:=a; edge[tot].v:=b; edge[tot].len:=c;
    end;
sort(1,tot);
ans:=1;
for i:=1 to q do
    begin
    readln(x,y);
    for j:=1 to n do fa[j]:=j;
    for j:=m downto 1 do
        begin
        a:=getf(edge[j].u); b:=getf(edge[j].v);
        if a<>b then fa[b]:=a;
        if getf(x)=getf(y) then
           begin knum:=j; break; end;
        end;
    ans:=int64(ans)*int64(edge[knum].len) mod p;
    end;
writeln(ans);
close(input);
close(output);
end.
