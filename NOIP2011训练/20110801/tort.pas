const maxn=1020;
      day:array[1..12]of longint=(31,28,31,30,31,30,31,31,30,31,30,31);
var n,i,fmin,minx,miny,t,ta,tb,ttt:longint;
    y,m,d,ind:array[1..maxn]of longint;
procedure sort(l,r: longint);
      var
         i,j,tmp,a,b,c: longint;
      begin
         i:=l;
         j:=r;
         a:=y[(l+r) div 2]; b:=m[(l+r)div 2]; c:=d[(l+r)div 2];
         repeat
           while (y[i]<a)or((y[i]=a)and(m[i]<b))or((y[i]=a)and(m[i]=b)and(d[i]<c)) do
            inc(i);
           while (a<y[j])or((a=y[j])and(b<m[j]))or((a=y[j])and(b=m[j])and(c<d[j])) do
            dec(j);
           if not(i>j) then
             begin
                tmp:=y[i]; y[i]:=y[j]; y[j]:=tmp;
                tmp:=m[i]; m[i]:=m[j]; m[j]:=tmp;
                tmp:=d[i]; d[i]:=d[j]; d[j]:=tmp;
                tmp:=ind[i]; ind[i]:=ind[j]; ind[j]:=tmp;
                inc(i);
                j:=j-1;
             end;
         until i>j;
         if l<j then
           sort(l,j);
         if i<r then
           sort(i,r);
      end;
function calc(u,v:longint):longint;
var ans,i:longint;
begin
ans:=0;
if (y[v]>y[u]) then
   begin
   ans:=365*((y[v]-1)-(y[u]+1)+1);
   for i:=m[u]+1 to 12 do ans:=ans+day[i];
   ans:=ans+day[m[u]]-d[u];
   for i:=1 to m[v]-1 do ans:=ans+day[i];
   ans:=ans+d[v];
   end
else
   begin
   for i:=m[u]+1 to m[v]-1 do ans:=ans+day[i];
   if m[u]<m[v] then
      begin
      ans:=ans+day[m[u]]-d[u];
      ans:=ans+d[v];
      end
   else ans:=ans+d[v]-d[u];
   end;
if ans<0 then
  ttt:=1;
exit(ans);
end;
begin
assign(input,'tort.in');
reset(input);
assign(output,'tort.out');
rewrite(output);
readln(n);
for i:=1 to n do
    begin
    readln(y[i],m[i],d[i]);
    ind[i]:=i;
    end;
sort(1,n);
fmin:=maxlongint; minx:=maxlongint; miny:=maxlongint;
for i:=1 to n-1 do
    begin
    t:=calc(i,i+1);
    if t<fmin then
       begin
       fmin:=t;
       if ind[i]<ind[i+1] then begin minx:=ind[i]; miny:=ind[i+1]; end
          else begin minx:=ind[i+1]; miny:=ind[i]; end;
       end
    else
       if t=fmin then
          begin
          ta:=ind[i]; tb:=ind[i+1]; if ta>tb then begin ta:=ta+tb; tb:=ta-tb; ta:=ta-tb; end;
          if ta<minx then begin minx:=ta; miny:=tb; end
             else if (ta=minx)and(tb<miny) then begin minx:=ta; miny:=tb; end;
          end;
    end;
writeln(minx,' ',miny,' ',fmin);
close(input);
close(output);
end.
