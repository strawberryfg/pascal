const maxn=100020;
var ll,rr,mid,k,cnt,last,i,l,n,m:longint;
    a:array[0..maxn]of longint;
procedure sort(l,r: longint);
      var
         i,j,x,y: longint;
      begin
         i:=l;
         j:=r;
         x:=a[(l+r) div 2];
         repeat
           while a[i]<x do
            inc(i);
           while x<a[j] do
            dec(j);
           if not(i>j) then
             begin
                y:=a[i];
                a[i]:=a[j];
                a[j]:=y;
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
readln(n,m);
m:=n-m;
for i:=1 to n do read(a[i]);
sort(1,n);
ll:=0; rr:=a[n];
while ll<=rr do
 begin
 mid:=(ll+rr)div 2;
 last:=a[1];
 cnt:=0;
 for i:=2 to n do
     begin
     if a[i]-last>=mid then last:=a[i] else inc(cnt);
     end;
 if cnt<=m then
    begin
    k:=mid;
    ll:=mid+1;
    end
 else rr:=mid-1;
 end;
last:=a[1]; cnt:=0;
for i:=2 to n do
    begin
    if a[i]-last>=ll then last:=a[i] else inc(cnt);
    end;
if cnt<=m then writeln(ll) else writeln(k);
end.