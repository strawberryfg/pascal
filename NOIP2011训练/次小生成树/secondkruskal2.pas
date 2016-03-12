const maxn=100; maxm=100;
var i,n,m,ans1,ans2:longint;
    a,b,f:array[1..maxm]of longint;
    fa,tfirst,first:array[1..maxn]of longint;
    can:array[1..maxm]of boolean;
function getfa(x:longint):longint;
begin
if fa[x]=x then exit(x)
   else begin
        fa[x]:=getfa(fa[x]);
        exit(fa[x]);
        end;
end;
 procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=f[(l+r) div 2];
         repeat
           while f[i]<x do
            inc(i);
           while x<f[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=f[i];
                f[i]:=f[j];
                f[j]:=y;
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
                y:=b[i];
                b[i]:=b[j];
                b[j]:=y;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
procedure kruskal;
var i,p,t1,t2:longint;
begin
for i:=1 to n do fa[i]:=i;
i:=0; p:=0; //p :jiedian
while (p<n-1)and(i<=m) do
  begin
  inc(i);
  if can[i] then
     begin
     t1:=getfa(a[i]); t2:=getfa(b[i]);
     if t1<>t2 then
        begin
        inc(p);
        fa[t2]:=t1;
        ans1:=ans1+f[i];
        first[p]:=i;
        end;
     end;
  end;
if (i=m)and(p<n-1) then ans1:=-1;
end;
begin
assign(input,'secondkruskal.in');
reset(input);
{assign(output,'secondkruskal.out');
rewrite(output);}
readln(n,m);
for i:=1 to m do
    begin
    readln(a[i],b[i],f[i]);
    end;
sort(1,m);
fillchar(can,sizeof(can),true);
kruskal;
tfirst:=first;
ans2:=maxlongint;
for i:=1 to n-1 do
    begin
    can[tfirst[i]]:=false;
    ans1:=0;
    kruskal;
    if (ans1>-1)and(ans1<ans2) then ans2:=ans1;
    can[tfirst[i]]:=true;
    end;
if ans2=maxlongint then ans2:=-1;
writeln(ans2);
close(input);
close(output);
end.