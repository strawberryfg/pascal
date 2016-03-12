const maxm=3200; maxn=120;
type rec=record u,v,z:longint; end;
var n,m,i,j,k,sum,fmin,x,y,w,t1,t2:longint;
    h:array[1..maxm]of rec;
    fa:array[1..maxn]of longint;
    pd:boolean;
procedure sort(l,r: longint);
      var
         i,j,x: longint;
         tmp:rec;
      begin
         i:=l;
         j:=r;
         x:=h[(l+r) div 2].z;
         repeat
           while h[i].z<x do
            inc(i);
           while x<h[j].z do
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
function getfa(x:longint):longint;
begin
if fa[x]=x then exit(x)
   else begin
        fa[x]:=getfa(fa[x]);
        exit(fa[x]);
        end;
end;
begin
assign(input,'span.in');
reset(input);
assign(output,'span.out');
rewrite(output);
readln(n,m);
for i:=1 to m do
    begin
    readln(x,y,w);
    h[i].u:=x; h[i].v:=y; h[i].z:=w;
    end;
sort(1,m);
fmin:=maxlongint;
for i:=1 to m-n+2 do
    begin
    for j:=1 to n do fa[j]:=j;
    sum:=0;
    for j:=i to m do
        begin
        t1:=getfa(h[j].u); t2:=getfa(h[j].v);
        if t1<>t2 then
           begin
           fa[t2]:=t1;
           inc(sum);
           t1:=getfa(1);
           t2:=getfa(n);
           pd:=false;
           if (t1=t2)and(sum=n-1) then pd:=true;
           if pd then
              begin
              if h[j].z-h[i].z<fmin then
                 fmin:=h[j].z-h[i].z;
              break;
              end;
           end;
        end;
    end;
if fmin=maxlongint then writeln(-1) else writeln(fmin);
close(input);
close(output);
end.
