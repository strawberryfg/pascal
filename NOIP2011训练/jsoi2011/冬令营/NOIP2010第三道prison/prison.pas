const maxn=202000;
      maxm=100;
var i,lc,rc,mid,n,m,knum,cnt:longint;
    a,b,c,fc,hash:array[0..maxn]of longint;
    edge,f,g:array[1..maxn,0..maxm]of longint;
    pd:boolean;
    h:boolean;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=c[(l+r) div 2];
         repeat
           while c[i]<x do
            inc(i);
           while x<c[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=c[i];
                c[i]:=c[j];
                c[j]:=y;
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
procedure dfs(d,r:longint);
var i:longint;
begin
if h=false then exit;
if fc[d]=r then exit;
if fc[d]=-r then
   begin
   h:=false;
   exit;
   end;
fc[d]:=r;
for i:=1 to g[d,0] do
    begin
    dfs(g[d,i],-r);
    //if not h then exit;
    end;
end;
function ok(x:longint):boolean;
var
    i,j,t,p,sum:longint;
begin
pd:=true;
fillchar(hash,sizeof(hash),0);
fillchar(g,sizeof(g),0);
fillchar(fc,sizeof(c),0);
h:=true;
sum:=0;
for i:=x to m do
    begin
    t:=a[i]; p:=b[i];
    inc(g[t,0]); g[t,g[t,0]]:=p;
    inc(g[p,0]); g[p,g[p,0]]:=t;
    end;
for i:=1 to n do
    begin
    if fc[i]=0 then dfs(i,1);
    if h=false then break;
    end;
exit(h);
end;
begin
assign(input,'prison.in');
reset(input);
assign(output,'prison.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
    begin
    readln(a[i],b[i],c[i]);

    end;
c[0]:=0;
{for i:=0 to m do
    begin
	writeln(i,'   :   ',a[i],'   ',b[i],'   ',c[i],'   ');
	end;
writeln;}
sort(0,m);
{for i:=0 to m do
    begin
    writeln(i,'   :   ',a[i],'  ',b[i],'  ',c[i],'  ');
    end;}
for i:=1 to m do
    begin
    cnt:=edge[a[i],0]+1;
    inc(edge[a[i],0]);
    edge[a[i],cnt]:=b[i];
    f[a[i],cnt]:=c[i];
    inc(f[a[i],0]);

    cnt:=edge[b[i],0]+1;
    inc(edge[b[i],0]);
    f[b[i],cnt]:=c[i];
    edge[b[i],cnt]:=a[i];
    inc(f[b[i],0]);
    end;
lc:=0; rc:=m;
while (rc-1>lc) do
  begin
  mid:=(lc+rc)div 2;
  if ok(mid) then
     begin
     knum:=mid;
     rc:=mid-1;
     end
  else lc:=mid+1;
  end;

if ok(lc) then writeln(c[lc-1])
   else begin
        if ok(rc) then writeln(c[rc-1])
                  else writeln(c[knum-1]);
        end;
close(input);
close(output);
end.
