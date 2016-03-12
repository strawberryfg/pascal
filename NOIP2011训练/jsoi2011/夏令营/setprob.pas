const maxn=100020;  maxm=400020;
type rec=record u,v,w:longint; end;
var n,m,i,j,ans,tot,x,y,z,t1,t2:longint;
    a,fa:array[0..maxn]of longint;
    h:array[1..maxm]of rec;
procedure sort(l,r: longint);
      var
         i,j,t: longint;
         tmp:rec;
      begin
         i:=l;
         j:=r;
         t:=h[(l+r) div 2].w;
         repeat
           while h[i].w<t do
            inc(i);
           while t<h[j].w do
            dec(j);
           if not(i>j) then
             begin
                tmp:=h[i];
                h[i]:=h[j];
                h[j]:=tmp;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
function getfa(num:longint):longint;
begin
if fa[num]=num then exit(num)
   else begin
        fa[num]:=getfa(fa[num]);
        exit(fa[num]);
        end;
end;
begin
assign(input,'setprob.in');
reset(input);
assign(output,'setprob.out');
rewrite(output);
readln(n,m);
tot:=0;
for i:=1 to n do
    begin
    fa[i]:=i;
    read(a[i]);
    inc(tot);
    h[tot].u:=0; h[tot].v:=i; h[tot].w:=a[i];
    end;
for i:=1 to m do
    begin
    readln(x,y,z);
    inc(tot);
    h[tot].u:=x; h[tot].v:=y; h[tot].w:=z;
    end;
sort(1,tot);
i:=1; j:=0; ans:=0;
while (i<=tot)and(j<=n-1) do
  begin
  t1:=getfa(h[i].u); t2:=getfa(h[i].v);
  if t1<>t2 then
     begin
     fa[t2]:=t1;
     ans:=ans+h[i].w;
     inc(j);
     end;
  inc(i);
  end;
writeln(ans);
close(input);
close(output);
end.