var n,k,c,i,j:longint;
ls:int64;
a:array[0..10000]of longint;
f:array[0..10000]of int64;
procedure sort(l,r: longint);
var i,j,x,y: longint;
begin
i:=l;j:=r;x:=a[(l+r) div 2];
repeat
   while a[i]<x do inc(i);
   while x<a[j] do dec(j);
   if not(i>j) then begin
     y:=a[i];a[i]:=a[j];a[j]:=y;
     inc(i);j:=j-1;
     end;
until i>j;
if l<j then sort(l,j);
if i<r then sort(i,r);
end;
begin
assign(input,'divide.in');reset(input);
assign(output,'divide.out');rewrite(output);
readln(n,k,c);
for i:=1 to n do read(a[i]);
sort(1,n);
for i:=k to n do begin
        f[i]:=a[i]-a[1];
        f[i]:=f[i]*(a[i]-a[1]);
        for j:=k to i-k do begin
                ls:=(a[i]-a[j+1]);
                ls:=ls*ls;
                ls:=ls+f[j];
                if ls<f[i] then f[i]:=ls;
                end;
        inc(f[i],c);
        end;
writeln(f[n]);
close(input);close(output);
end.
